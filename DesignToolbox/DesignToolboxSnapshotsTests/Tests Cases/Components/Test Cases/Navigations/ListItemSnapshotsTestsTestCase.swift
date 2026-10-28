// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit
// swiftlint:disable type_body_length

// MARK: - Test Cases

/// Tests the UI rendering of `MISOStaticListItem` and `MISONavigationListItem` for selected parameter combinations.
///
/// The full combinatoric space is intentionally not covered. Instead, interesting cases are picked
/// along each axis:
/// - **Style**: outlined, standard (divider only, background only, both)
/// - **Alignment**: top, center
/// - **Size**: standard, small
/// - **Rounded media**: enabled/disabled (on image leading/trailing)
/// - **Leading elements**: none, icon (neutral), icon (negative), image, flag, avatar (icon / initials / image)
/// - **Trailing elements**: none, text (label / labelStrong / labelAndExtraLabel), badge, tag, icon, image, flag, avatar
///
/// To limit the amount of reference images, the `textCase`/`isBold` axis is not given a dedicated reference
/// image each: for every combination above, it is gathered into a single ``SnapshotGrid`` (one per `static`/
/// `navigation` component), with one assertion (and so one reference image) per grid. Each cell of the grid
/// carries a short caption so a regression stays identifiable directly in the resulting image.
/// See `SnapshotGrid.swift`.
open class ListItemSnapshotsTestsTestCase: XCTestCase {

    /// The number of columns used to lay out the `textCase`/`isBold` grid for a list item configuration.
    private static let gridColumns = 2

    /// Fixed size applied to each cell of the grid, so the resulting image has a stable, reproducible size.
    private static let gridCellSize = CGSize(width: 420, height: 260)

    // MARK: - Text case helper

    /// The set of text configurations to exercise on every test dimension.
    enum TextCase: String, CaseIterable {
        /// Only the mandatory label is provided.
        case labelOnly
        /// Label with overline, extraLabel, and description (no helper text).
        case fullWithoutHelper
        /// All text fields provided (label + overline + extraLabel + description + helperText).
        case full
        /// Label with helper text only.
        case labelAndHelper

        /// Short caption identifying the text case, displayed in a grid cell.
        var captionName: String {
            switch self {
            case .labelOnly:
                "Label only"
            case .fullWithoutHelper:
                "Full (no helper)"
            case .full:
                "Full"
            case .labelAndHelper:
                "Label + helper"
            }
        }

        /// The description text used for this case, if any.
        ///
        /// Kept locally (rather than read back from `MISOListItemData`) because that property
        /// is `internal` to the MISO package and not accessible from this test target.
        private var descriptionText: String? {
            switch self {
            case .labelOnly, .labelAndHelper:
                nil
            case .fullWithoutHelper, .full:
                "Description"
            }
        }

        /// The overline text used for this case, if any.
        private var overlineText: String? {
            switch self {
            case .labelOnly, .labelAndHelper:
                nil
            case .fullWithoutHelper, .full:
                "Overline"
            }
        }

        /// The extra label text used for this case, if any.
        private var extraLabelText: String? {
            switch self {
            case .labelOnly, .labelAndHelper:
                nil
            case .fullWithoutHelper, .full:
                "Extra label"
            }
        }

        /// The helper text used for this case, if any.
        private var helperTextText: String? {
            switch self {
            case .labelOnly, .fullWithoutHelper:
                nil
            case .full, .labelAndHelper:
                "Helper text"
            }
        }

        var data: MISOListItemData {
            MISOListItemData(
                label: "Label",
                description: descriptionText.map { .raw($0) },
                overline: overlineText.map { .raw($0) },
                extraLabel: extraLabelText.map { .raw($0) },
                helperText: helperTextText.map { .raw($0) })
        }

        func boldData() -> MISOListItemData {
            MISOListItemData(
                label: .textual("Label", isBold: true),
                description: descriptionText.map { .raw($0) },
                overline: overlineText.map { .raw($0) },
                extraLabel: extraLabelText.map { .raw($0) },
                helperText: helperTextText.map { .raw($0) })
        }
    }

    /// A single configuration of `textCase` x `isBold` to fold into a grid cell.
    private struct TextVariant {
        let textCase: TextCase
        let isBold: Bool

        /// All the `textCase` x `isBold` combinations.
        static let all: [TextVariant] = TextCase.allCases.flatMap { textCase in
            [false, true].map { TextVariant(textCase: textCase, isBold: $0) }
        }

        var data: MISOListItemData {
            isBold ? textCase.boldData() : textCase.data
        }

        /// Short caption identifying the variant, displayed under its grid cell.
        var caption: String {
            "\(textCase.captionName) · \(isBold ? "Bold" : "Regular")"
        }
    }

    /// The two kinds of list item components covered by these tests.
    private enum ComponentKind {
        case staticItem
        case navigation

        /// Builds the raw list item (without any content style/alignment/size modifier) for this component kind.
        @MainActor func build(data: MISOListItemData, leading: MISOListItemLeading?, trailing: MISOListItemTrailing?) -> AnyView {
            switch self {
            case .staticItem:
                AnyView(MISOStaticListItem(data: data, leading: leading, trailing: trailing))
            case .navigation:
                AnyView(MISONavigationListItem(data: data, indicatorType: .next, leading: leading, trailing: trailing))
            }
        }
    }

    /// Bundles the parameters of a list item configuration which are kept as separate reference images
    /// (structurally significant axes), as opposed to `textCase`/`isBold` which are folded into a grid.
    private struct ListItemConfiguration {
        let style: MISOListItemContentStyle
        let alignment: MISOListItemContainersAlignment
        let size: MISOListItemSize
        let rounded: Bool
        let leading: MISOListItemLeading?
        let trailing: MISOListItemTrailing?
        let kind: ComponentKind

        init(kind: ComponentKind,
             style: MISOListItemContentStyle = .card(.outlined()),
             alignment: MISOListItemContainersAlignment = .center,
             size: MISOListItemSize = .default,
             rounded: Bool = false,
             leading: MISOListItemLeading? = nil,
             trailing: MISOListItemTrailing? = nil)
        {
            self.style = style
            self.alignment = alignment
            self.size = size
            self.rounded = rounded
            self.leading = leading
            self.trailing = trailing
            self.kind = kind
        }
    }

    // MARK: - Style tests

    /// Tests all content styles (outlined and standard variants) with both component types.
    ///
    /// Other parameters are fixed: alignment=center, size=standard, no leading, no trailing.
    ///
    /// - Parameters:
    ///   - theme: The theme to apply.
    ///   - interfaceStyle: The color scheme (light or dark).
    @MainActor func testAllStyles(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let styles: [(MISOListItemContentStyle, String)] = [
            (.card(.outlined(onlyOnInteraction: false)), "card_outlined"),
            (.card(.outlined(onlyOnInteraction: true)), "card_outlinedOnInteractionOnly"),
            (.card(.standard(divider: true, background: true)), "card_backgroundWithDivider"),
            (.card(.standard(divider: false, background: true)), "card_backgroundWithoutDivider"),
            (.card(.standard(divider: true, background: false)), "card_backgroundOnInteractionOnlyWithDivider"),
            (.card(.standard(divider: false, background: false)), "card_backgroundOnInteractionOnlyWithoutDivider"),
            (.item(divider: false, background: true), "standard_backgroundWithoutDivider"),
            (.item(divider: true, background: false), "standard_backgroundOnInteractionOnlyWithDivider"),
        ]
        for (style, styleName) in styles {
            testListItemGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                name: "static_\(styleName)_center_standard",
                configuration: ListItemConfiguration(kind: .staticItem, style: style))
            testListItemGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                name: "navigation_\(styleName)_center_standard",
                configuration: ListItemConfiguration(kind: .navigation, style: style))
        }
    }

    // MARK: - Alignment tests

    /// Tests top and center alignment with both component types.
    ///
    /// Other parameters are fixed: style=outlined, size=standard, leading=icon(neutral), trailing=text(.label).
    ///
    /// - Parameters:
    ///   - theme: The theme to apply.
    ///   - interfaceStyle: The color scheme (light or dark).
    @MainActor func testAllAlignments(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let alignments: [(MISOListItemContainersAlignment, String)] = [
            (.top, "top"),
            (.center, "center"),
        ]
        let leading = MISOListItemLeading.icon(MISOListItemIcon(status: .neutral(asset: Image(decorative: "ic_heart")), description: ""))
        let trailing = MISOListItemTrailing.text(.label("Label"))
        for (alignment, alignmentName) in alignments {
            testListItemGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                name: "static_outlined_\(alignmentName)_standard",
                configuration: ListItemConfiguration(kind: .staticItem, alignment: alignment, leading: leading, trailing: trailing))
            testListItemGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                name: "navigation_outlined_\(alignmentName)_standard",
                configuration: ListItemConfiguration(kind: .navigation, alignment: alignment, leading: leading, trailing: trailing))
        }
    }

    // MARK: - Size tests

    /// Tests standard and small sizes with both component types.
    ///
    /// Note: in `.small` size, `overline` and `extraLabel` are automatically hidden by the component.
    ///
    /// Other parameters are fixed: style=outlined, alignment=center, no leading, no trailing.
    ///
    /// - Parameters:
    ///   - theme: The theme to apply.
    ///   - interfaceStyle: The color scheme (light or dark).
    @MainActor func testAllSizes(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let sizes: [(MISOListItemSize, String)] = [
            (.default, "standard"),
            (.small, "small"),
        ]
        for (size, sizeName) in sizes {
            testListItemGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                name: "static_outlined_center_\(sizeName)",
                configuration: ListItemConfiguration(kind: .staticItem, size: size))
            testListItemGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                name: "navigation_outlined_center_\(sizeName)",
                configuration: ListItemConfiguration(kind: .navigation, size: size))
        }
    }

    // MARK: - Rounded media tests

    /// Tests rounded media flag (true/false) with image as leading and trailing elements.
    ///
    /// Other parameters are fixed: style=outlined, alignment=center, size=standard.
    ///
    /// - Parameters:
    ///   - theme: The theme to apply.
    ///   - interfaceStyle: The color scheme (light or dark).
    @MainActor func testRoundedMedia(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let image = Image(decorative: "ic_heart")
        let leading = MISOListItemLeading.image(.init(asset: image))
        let trailing = MISOListItemTrailing.image(.init(asset: image))
        for rounded in [false, true] {
            let roundedSuffix = rounded ? "_RoundedMedia" : ""
            testListItemGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                name: "static_outlined_center_standard\(roundedSuffix)",
                configuration: ListItemConfiguration(kind: .staticItem, rounded: rounded, leading: leading, trailing: trailing))
            testListItemGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                name: "navigation_outlined_center_standard\(roundedSuffix)",
                configuration: ListItemConfiguration(kind: .navigation, rounded: rounded, leading: leading, trailing: trailing))
        }
    }

    // MARK: - Leading tests

    /// Tests all leading elements with both component types.
    ///
    /// Other parameters are fixed: style=outlined, alignment=center, size=standard, no trailing.
    ///
    /// - Parameters:
    ///   - theme: The theme to apply.
    ///   - interfaceStyle: The color scheme (light or dark).
    @MainActor func testAllLeadings(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let image = Image(decorative: "ic_heart")
        let leadings: [(MISOListItemLeading?, String)] = [
            (nil, "none"),
            (.icon(MISOListItemIcon(status: .neutral(asset: image), description: "icon_neutral")), "icon_neutral"),
            (.icon(MISOListItemIcon(status: .negative, description: "icon_negative")), "icon_negative"),
            (.image(.init(asset: image)), "image"),
            (.flag(.init(asset: image, description: "France")), "flag"),
            (.avatar(MISOListItemAvatar(type: .icon, size: .medium)), "avatar_icon"),
            (.avatar(MISOListItemAvatar(type: .initials("MT"), size: .medium)), "avatar_initials"),
            (.avatar(MISOListItemAvatar(type: .image(image), size: .medium)), "avatar_image"),
        ]
        for (leading, leadingName) in leadings {
            testListItemGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                name: "static_outlined_center_standard_Leading_\(leadingName)",
                configuration: ListItemConfiguration(kind: .staticItem, leading: leading))
            testListItemGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                name: "navigation_outlined_center_standard_Leading_\(leadingName)",
                configuration: ListItemConfiguration(kind: .navigation, leading: leading))
        }
    }

    // MARK: - Trailing tests

    /// Tests all trailing elements with both component types.
    ///
    /// Other parameters are fixed: style=outlined, alignment=center, size=standard, no leading.
    ///
    /// - Parameters:
    ///   - theme: The theme to apply.
    ///   - interfaceStyle: The color scheme (light or dark).
    @MainActor func testAllTrailings(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let image = Image(decorative: "ic_heart")
        let trailings: [(MISOListItemTrailing?, String)] = [
            (nil, "none"),
            (.text(.label("Label")), "text_label"),
            (.text(.labelStrong("Label")), "text_labelStrong"),
            (.text(.labelAndExtraLabel("Label", "Extra")), "text_labelAndExtraLabel"),
            (.badge(.standard(MISOBadgeStandard(accessibilityLabel: "", status: .negative, size: .small))), "badge"),
            (.tag(MISOTag(label: "Tag")), "tag"),
            (.icon(MISOListItemIcon(status: .neutral(asset: image), description: "icon_neutral")), "icon_neutral"),
            (.image(.init(asset: image)), "image"),
            (.flag(.init(asset: image, description: "France")), "flag"),
            (.avatar(MISOListItemAvatar(type: .icon, size: .medium)), "avatar_icon"),
        ]
        for (trailing, trailingName) in trailings {
            testListItemGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                name: "static_outlined_center_standard_Trailing_\(trailingName)",
                configuration: ListItemConfiguration(kind: .staticItem, trailing: trailing))
            testListItemGrid(
                theme: theme,
                interfaceStyle: interfaceStyle,
                name: "navigation_outlined_center_standard_Trailing_\(trailingName)",
                configuration: ListItemConfiguration(kind: .navigation, trailing: trailing))
        }
    }

    // MARK: - Private helpers

    /// Builds the grid cell for a given text variant and list item configuration.
    @MainActor private func listItemVariantCell(
        _ variant: TextVariant,
        theme: MISOTheme,
        configuration: ListItemConfiguration) -> SnapshotGridCell<AnyView>
    {
        SnapshotGridCell(caption: variant.caption) {
            AnyView(
                MISOThemeableView(theme: theme) {
                    configuration.kind.build(data: variant.data, leading: configuration.leading, trailing: configuration.trailing)
                        .misoListContentStyle(configuration.style)
                        .misoListItemContainerAlignment(configuration.alignment)
                        .misoListItemSize(configuration.size)
                        .misoListItemRoundedMedia(configuration.rounded)
                })
        }
    }

    /// Builds a ``SnapshotGrid`` gathering all `textCase` x `isBold` combinations for a given list item
    /// configuration, then captures it in a single snapshot.
    ///
    /// The snapshot is saved with a name based on the parameters which are not folded into the grid.
    ///
    /// - Parameters:
    ///   - theme: The theme (MISOTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - name: the snapshot name for this configuration
    ///   - configuration: the structurally significant parameters of the list item (style, alignment, size, rounded, leading, trailing, kind)
    @MainActor private func testListItemGrid(
        theme: MISOTheme,
        interfaceStyle: UIUserInterfaceStyle,
        name: String,
        configuration: ListItemConfiguration)
    {
        let cells = TextVariant.all.map {
            listItemVariantCell($0, theme: theme, configuration: configuration)
        }

        let testName = "testListItem_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let grid = SnapshotGrid(
            columns: Self.gridColumns,
            cellSize: Self.gridCellSize,
            cells: cells,
            title: "\(testName).\(name)")

        let colorScheme: ColorScheme = interfaceStyle == .light ? .light : .dark
        let illustration = MISOThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: colorScheme))
        }

        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }

    // MARK: - Skeleton

    /// This function tests the `MISOStaticListItem` and `MISONavigationListItem` skeleton states (default configuration)
    /// for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testListItemSkeleton(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let colorScheme: ColorScheme = interfaceStyle == .light ? .light : .dark
        let data = MISOListItemData(label: .textual("Label"))
        let illustration = MISOThemeableView(theme: theme) {
            VStack {
                MISOStaticListItem(data: data)
                    .showSkeleton(isVisible: true, isAnimated: false)
                MISONavigationListItem(data: data, indicatorType: .next)
                    .showSkeleton(isVisible: true, isAnimated: false)
            }
            .background(theme.colors.bgPrimary.color(for: colorScheme))
        }

        let testName = "testListItemSkeleton_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "ListItemSkeleton"

        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }
}

// swiftlint:enable type_body_length
// swiftlint:enable required_deinit
