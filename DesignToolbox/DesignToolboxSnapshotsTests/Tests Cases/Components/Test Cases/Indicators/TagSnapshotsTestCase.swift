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

/// Tests the UI rendering of the `MISOTag` and `MISOInputTag` for each parameter.
///
/// To limit the amount of reference images, combinatorial axes are gathered into a single ``SnapshotGrid``
/// per remaining-axis combination (one assertion = one reference image). The grid is laid out with one row
/// per status/appearance so a regression touching a single status stays identifiable at a glance.
///
/// Axes kept as separate files (= filename):
///   - `MISOTag`: `layout` (3 values) and the state (`enabled`/`disabled`/`loading`). For the enabled
///     state, `appearance` (`emphasized` / `muted`) and `statusCategory` (6 values) are also promoted
///     to dedicated files because each pair paints the badge with a distinctly different color palette,
///     making a per-combination reference image worthwhile for visual diffs → 42 files per theme/scheme.
///   - `MISOInputTag`: nothing (single grid folding the `enabled` axis).
///
/// Axes folded into the grid:
///   - `MISOTag` enabled: `size × shape` (and `iconType × flipIcon` for `textAndIcon` on `accent`/`neutral`
///     statuses, where `enableFlipIcon` is true).
///   - `MISOTag` disabled: `size × shape` (and `iconType × flipIcon` for `textAndIcon`). The source code
///     already fixes `statusCategory = .accent` and `appearance = .emphasized` for the disabled state since
///     those parameters do not change the disabled rendering.
///   - `MISOTag` loading: `size × shape`. `MISOTag(loadingLabel:)` does not take a `status` nor an
///     `appearance` parameter, so looping on `statusCategory` would produce identical images; it is folded
///     to a single `.accent` value here.
///
/// **Warning: the loader state in indeterminate variant tag is not tested because of discrepancies with
/// snapshots comparisons.**
///
/// **Note on the determinate loading indicator**: `MISOTag(loadingLabel:progress:)` uses
/// `MISOCircularProgressIndicator(animated: true)` internally, which animates the arc from 0 to the
/// target `progress` on first display. A snapshot is captured on the first frame, so the arc is empty
/// (and the track is disabled on this component), making the indicator invisible on the reference
/// image. To get the arc at its target value, snapshot cells for loading configurations disable
/// SwiftUI animations through a `.transaction { $0.animation = nil }` modifier — see ``tagCell(theme:model:caption:)``.
///
/// Each cell of a grid carries a short caption so a regression stays identifiable directly in the resulting
/// image. See `SnapshotGrid.swift`.
open class TagSnapshotsTestsTestCase: XCTestCase {

    /// Fixed size applied to each cell of a tag grid. Width accommodates the longest caption and the
    /// textAndIcon layout; height accommodates two caption lines.
    private static let tagCellSize = CGSize(width: 220, height: 70)

    /// Fixed size applied to each cell of the input tag grid.
    private static let inputTagCellSize = CGSize(width: 220, height: 60)

    // MARK: - Tags

    /// Tests all tags with all types, appearances, status and size for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllTags(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        for layout in TagLayout.allCases {
            testTagDisabledGrid(theme: theme, interfaceStyle: interfaceStyle, layout: layout)
            for appearance in MISOTag.Appearance.allCases {
                for status in MISOTag.Status.Category.allCases {
                    testTagEnabledGrid(theme: theme,
                                       interfaceStyle: interfaceStyle,
                                       layout: layout,
                                       appearance: appearance,
                                       status: status)
                }
            }
            testTagLoadingGrid(theme: theme, interfaceStyle: interfaceStyle, layout: layout)
        }
    }

    // MARK: - MISOTag Enabled

    /// Builds a ``SnapshotGrid`` gathering all enabled-state variations for a given layout, appearance
    /// and status.
    ///
    /// Grid folds the `size × shape` (and optionally `iconType × flipIcon`) axes. `appearance` and
    /// `statusCategory` are promoted to the filename because each pair paints the badge with a distinctly
    /// different color palette, making a dedicated reference image worthwhile for visual diffs.
    @MainActor private func testTagEnabledGrid(theme: MISOTheme,
                                               interfaceStyle: UIUserInterfaceStyle,
                                               layout: TagLayout,
                                               appearance: MISOTag.Appearance,
                                               status: MISOTag.Status.Category)
    {
        let cells = enabledCells(theme: theme, layout: layout, appearance: appearance, status: status)
        assertTagGrid(theme: theme,
                      interfaceStyle: interfaceStyle,
                      layout: layout,
                      state: "\(appearance.shortName)-\(status.shortName)-Enabled",
                      columns: MISOTag.Size.allCases.count,
                      cells: cells)
    }

    /// Builds the cells for the enabled grid. Cells are emitted in `(shape × iconVariant) × size` order
    /// so that laying them out with `columns = MISOTag.Size.allCases.count` yields a portrait grid where
    /// each column maps to a single `size` and each row maps to a `(shape, iconVariant)` combination.
    @MainActor private func enabledCells(theme: MISOTheme,
                                         layout: TagLayout,
                                         appearance: MISOTag.Appearance,
                                         status: MISOTag.Status.Category) -> [SnapshotGridCell<AnyView>]
    {
        var cells: [SnapshotGridCell<AnyView>] = []
        for shape in MISOTag.Shape.allCases {
            for iconVariant in iconVariants(layout: layout, status: status) {
                for size in MISOTag.Size.allCases {
                    let model = TagConfigurationModel()
                    model.isLoading = false
                    model.enabled = true
                    model.layout = layout
                    model.appearance = appearance
                    model.statusCategory = status
                    model.size = size
                    model.shape = shape
                    model.iconType = iconVariant.iconType
                    model.flipIcon = iconVariant.flipIcon
                    cells.append(tagCell(theme: theme,
                                         model: model,
                                         caption: enabledCaption(size: size,
                                                                 shape: shape,
                                                                 iconVariant: iconVariant)))
                }
            }
        }
        return cells
    }

    // MARK: - MISOTag Disabled

    /// Builds a ``SnapshotGrid`` gathering all disabled-state variations for a given layout.
    ///
    /// The disabled rendering does not depend on `appearance` nor `statusCategory` (fixed to `.emphasized`
    /// and `.accent` as in the original per-image tests), so only `size × shape` and the optional
    /// `iconType × flipIcon` axes vary. Cells are emitted in `(shape × iconVariant) × size` order so that
    /// laying them out with `columns = MISOTag.Size.allCases.count` yields a portrait grid where each
    /// column maps to a single `size`.
    @MainActor private func testTagDisabledGrid(theme: MISOTheme,
                                                interfaceStyle: UIUserInterfaceStyle,
                                                layout: TagLayout)
    {
        var cells: [SnapshotGridCell<AnyView>] = []
        for shape in MISOTag.Shape.allCases {
            for iconVariant in iconVariants(layout: layout, status: .accent) {
                for size in MISOTag.Size.allCases {
                    let model = TagConfigurationModel()
                    model.isLoading = false
                    model.enabled = false
                    model.layout = layout
                    model.appearance = .emphasized
                    model.statusCategory = .accent
                    model.size = size
                    model.shape = shape
                    model.iconType = iconVariant.iconType
                    model.flipIcon = iconVariant.flipIcon
                    cells.append(tagCell(theme: theme,
                                         model: model,
                                         caption: disabledOrLoadingCaption(size: size,
                                                                           shape: shape,
                                                                           iconVariant: iconVariant)))
                }
            }
        }
        assertTagGrid(theme: theme,
                      interfaceStyle: interfaceStyle,
                      layout: layout,
                      state: "Disabled",
                      columns: MISOTag.Size.allCases.count,
                      cells: cells)
    }

    // MARK: - MISOTag Loading

    /// Builds a ``SnapshotGrid`` gathering all loading-state variations for a given layout.
    ///
    /// `MISOTag(loadingLabel:)` does not take `status` nor `appearance`, so only `size × shape` axes vary.
    @MainActor private func testTagLoadingGrid(theme: MISOTheme,
                                               interfaceStyle: UIUserInterfaceStyle,
                                               layout: TagLayout)
    {
        var cells: [SnapshotGridCell<AnyView>] = []
        for size in MISOTag.Size.allCases {
            for shape in MISOTag.Shape.allCases {
                let model = TagConfigurationModel()
                model.isLoading = true
                model.enabled = true
                model.flipIcon = false
                model.layout = layout
                model.statusCategory = .accent
                model.size = size
                model.shape = shape
                model.progressVariant = .determinate
                model.progressValue = 0.75
                cells.append(tagCell(theme: theme,
                                     model: model,
                                     caption: disabledOrLoadingCaption(size: size, shape: shape, iconVariant: nil)))
            }
        }
        assertTagGrid(theme: theme,
                      interfaceStyle: interfaceStyle,
                      layout: layout,
                      state: "Loading",
                      columns: MISOTag.Shape.allCases.count,
                      cells: cells)
    }

    // MARK: - MISOTag Grid Helpers

    /// A single icon-related variant used to iterate over `iconType × flipIcon`.
    private struct IconVariant {
        let iconType: DefinedStatusIcons
        let flipIcon: Bool
    }

    /// The relevant `iconType × flipIcon` combinations for a given `layout` and `statusCategory`.
    ///
    /// Mirrors `TagConfigurationModel.enableFlipIcon`: the icon axis only varies in `textAndIcon` layout
    /// and only for `.accent` and `.neutral` statuses. In every other case a single neutral variant is
    /// returned so grid rows remain rectangular.
    private func iconVariants(layout: TagLayout, status: MISOTag.Status.Category) -> [IconVariant] {
        let enableFlipIcon = (layout == .textAndIcon && (status == .accent || status == .neutral))
        guard enableFlipIcon else {
            return [IconVariant(iconType: .tintedIcon, flipIcon: false)]
        }
        return DefinedStatusIcons.allCases.flatMap { iconType in
            [false, true].map { IconVariant(iconType: iconType, flipIcon: $0) }
        }
    }

    /// Builds a short caption for an enabled-state cell. `appearance` and `status` are omitted since
    /// they are both in the filename.
    private func enabledCaption(size: MISOTag.Size,
                                shape: MISOTag.Shape,
                                iconVariant: IconVariant) -> String
    {
        let base = "\(size.shortName)·\(shape.shortName)"
        guard let icon = iconVariantSuffix(iconVariant) else {
            return base
        }
        return "\(base)\n\(icon)"
    }

    /// Builds a short caption for a disabled or loading-state cell.
    private func disabledOrLoadingCaption(size: MISOTag.Size,
                                          shape: MISOTag.Shape,
                                          iconVariant: IconVariant?) -> String
    {
        let base = "\(size.shortName)·\(shape.shortName)"
        guard let iconVariant,
              let icon = iconVariantSuffix(iconVariant)
        else {
            return base
        }
        return "\(base)\n\(icon)"
    }

    /// Returns the icon-related part of a caption, or `nil` when the icon axis is irrelevant for this cell.
    private func iconVariantSuffix(_ iconVariant: IconVariant) -> String? {
        // No icon axis variation for this cell: nothing to show.
        if iconVariant.iconType == .tintedIcon, !iconVariant.flipIcon {
            return nil
        }
        let iconLabel = iconVariant.iconType == .image ? "Original" : "Template"
        let flipLabel = iconVariant.flipIcon ? "Flip" : "NoFlip"
        return "\(iconLabel)·\(flipLabel)"
    }

    /// Builds the grid cell for a given `TagConfigurationModel`.
    ///
    /// For loading configurations, SwiftUI animations are disabled through a transaction so the
    /// `MISOCircularProgressIndicator` reveal animation is skipped and the snapshot captures the arc
    /// at its target `progress` value instead of an empty arc at `t=0`.
    @MainActor private func tagCell(theme: MISOTheme,
                                    model: TagConfigurationModel,
                                    caption: String) -> SnapshotGridCell<AnyView>
    {
        let isLoading = model.isLoading
        return SnapshotGridCell(caption: caption) {
            AnyView(
                MISOThemeableView(theme: theme) {
                    TagDemo(configurationModel: model)
                        .transaction { transaction in
                            if isLoading {
                                transaction.animation = nil
                            }
                        }
                })
        }
    }

    /// Composes the grid and captures a single snapshot assertion.
    ///
    /// The snapshot is saved with a name based on the parameters which are not folded into the grid:
    ///    testTag_<themeName>_<colorScheme>.<layout>-<state>
    @MainActor private func assertTagGrid(theme: MISOTheme,
                                          interfaceStyle: UIUserInterfaceStyle,
                                          layout: TagLayout,
                                          state: String,
                                          columns: Int,
                                          cells: [SnapshotGridCell<AnyView>])
    {
        let testName = "testTag_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "\(layout.debugDescription)-\(state)"

        let grid = SnapshotGrid(
            columns: columns,
            cellSize: Self.tagCellSize,
            cells: cells,
            title: "\(testName).\(name)")

        let illustration = MISOThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    // MARK: - Input tags

    /// This function tests all input tags with disable state for the given theme and color scheme.
    ///
    /// Both `enabled` values are folded into a single grid.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllInputTags(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let cells: [SnapshotGridCell<AnyView>] = [true, false].map { enabled in
            let model = InputTagConfigurationModel()
            model.enabled = enabled
            return SnapshotGridCell(caption: enabled ? "Enabled" : "Disabled") {
                AnyView(
                    MISOThemeableView(theme: theme) {
                        InputTagDemo(configurationModel: model)
                    })
            }
        }

        let testName = "testInputTag_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "InputTag"

        let grid = SnapshotGrid(
            columns: 2,
            cellSize: Self.inputTagCellSize,
            cells: cells,
            title: "\(testName).\(name)")

        let illustration = MISOThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    // MARK: - Skeleton

    /// This function tests the `MISOTag` skeleton state (default configuration) for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testTagSkeleton(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Generate the illustration for the specified configuration
        let illustration = MISOThemeableView(theme: theme) {
            MISOTag(label: "Tag")
                .showSkeleton(isVisible: true, isAnimated: false)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "testTag_skeleton_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "TagSkeleton"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    /// This function tests the `MISOInputTag` skeleton state (default configuration) for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testInputTagSkeleton(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Generate the illustration for the specified configuration
        let illustration = MISOThemeableView(theme: theme) {
            MISOInputTag(label: "Input tag") {}
                .showSkeleton(isVisible: true, isAnimated: false)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "testInputTagSkeleton_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "InputTagSkeleton"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// MARK: - Short Name Helpers

extension TagLayout: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .textOnly:
            "textOnly"
        case .textAndBullet:
            "textAndBullet"
        case .textAndIcon:
            "textAndIcon"
        }
    }
}

/// Short names used in grid cell captions to keep them compact.
/// Internal (not `fileprivate`) so `CategoricalTagSnapshotsTestCase.swift` can reuse them for the
/// `MISOTag.Size` and `MISOTag.Shape` enums, which categorical tags also use.
extension MISOTag.Appearance {
    var shortName: String {
        self == .emphasized ? "Emph" : "Muted"
    }
}

extension MISOTag.Status.Category {
    var shortName: String {
        switch self {
        case .neutral:
            "Neutral"
        case .accent:
            "Accent"
        case .positive:
            "Positive"
        case .warning:
            "Warning"
        case .negative:
            "Negative"
        case .info:
            "Info"
        }
    }
}

extension MISOTag.Size {
    var shortName: String {
        self == .default ? "Default" : "Small"
    }
}

extension MISOTag.Shape {
    var shortName: String {
        self == .rounded ? "Rounded" : "Square"
    }
}

// swiftlint:enable required_deinit
// swiftlint:enable type_body_length
