// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOLink` for each parameter
///
/// To limit the amount of reference images, the `disabled`, `iconType` (relevant for `textAndIcon` layout only)
/// and `isFullWidth` (relevant for `indicatorNext`/`indicatorPrevious` layouts only) axes are not given a
/// dedicated reference image each: they are gathered into a single ``SnapshotGrid`` per (theme, color scheme,
/// surface, layout, size, density) combination, with one assertion (and so one reference image) per grid.
/// Each cell of the grid carries a short caption so a regression stays identifiable directly in the resulting
/// image. See `SnapshotGrid.swift`.
open class LinkSnapshotsTestsTestCase: XCTestCase {

    /// The number of columns used to lay out the combinatorial grid for a link configuration.
    private static let gridColumns = 2

    /// Fixed size applied to each cell of the grid, so the resulting image has a stable, reproducible size.
    private static let gridCellSize = CGSize(width: 220, height: 80)

    /// This function tests all link configuration for the given theme and color schemes on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    /// **The loading style is not tested yet as we face troubles with animations and snapshots.**
    ///
    /// It iterates through all link `layouts`, for all `sizes` and `densities`.
    /// For each of these combinations, a single grid image gathers the `enabled/disabled` variations
    /// (and, for `textAndIcon` layout, the `iconType` variations, or, for `indicatorNext`/`indicatorPrevious`
    /// layouts, the `isFullWidth` variations).
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testAllLinks(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        for layout in LinkLayout.allCases {
            for size in MISOLink.Size.allCases {
                for density in MISOLink.Density.allCases {
                    testLinkGrid(theme: theme,
                                 interfaceStyle: interfaceStyle,
                                 layout: layout,
                                 size: size,
                                 density: density,
                                 onColoredSurface: false)
                }
            }
        }
    }

    /// This function tests all link configuration for the given theme and color schemes on a colored surface (the `surfaceBrandPrimary` token)
    ///
    /// **/!\ It does not text the hover and pressed states.**
    /// **The loading style is not tested yet as we face troubles with animations and snapshots.**
    ///
    /// It iterates through all link `layouts`, for all `sizes` and `densities`.
    /// For each of these combinations, a single grid image gathers the `enabled/disabled` variations
    /// (and, for `textAndIcon` layout, the `iconType` variations, or, for `indicatorNext`/`indicatorPrevious`
    /// layouts, the `isFullWidth` variations).
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllLinksOnColoredSurface(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        for layout in LinkLayout.allCases {
            for size in MISOLink.Size.allCases {
                for density in MISOLink.Density.allCases {
                    testLinkGrid(theme: theme,
                                 interfaceStyle: interfaceStyle,
                                 layout: layout,
                                 size: size,
                                 density: density,
                                 onColoredSurface: true)
                }
            }
        }
    }

    /// A single configuration of `disabled` x `iconType` x `isFullWidth` to fold into a grid cell.
    /// `iconType` is only relevant for the `textAndIcon` layout, and `isFullWidth` only for the
    /// `indicatorNext`/`indicatorPrevious` layouts; for other layouts they keep their default value
    /// and are not reflected in the caption.
    private struct LinkVariant {
        let disabled: Bool
        let iconType: DefinedStatusIcons
        let isFullWidth: Bool

        /// All relevant `disabled` x `iconType` x `isFullWidth` combinations for the given `layout`.
        static func all(for layout: LinkLayout) -> [LinkVariant] {
            let iconTypes: [DefinedStatusIcons] = layout == .textAndIcon ? DefinedStatusIcons.allCases : [.tintedIcon]
            let fullWidths: [Bool] = (layout == .indicatorNext || layout == .indicatorPrevious) ? [false, true] : [false]
            return [false, true].flatMap { disabled in
                iconTypes.flatMap { iconType in
                    fullWidths.map { isFullWidth in
                        LinkVariant(disabled: disabled, iconType: iconType, isFullWidth: isFullWidth)
                    }
                }
            }
        }

        /// Short caption identifying the variant, displayed under its grid cell.
        /// Only the axes relevant for `layout` are mentioned.
        func caption(layout: LinkLayout) -> String {
            var components = [disabled ? "Disabled" : "Enabled"]
            if layout == .textAndIcon {
                components.append(iconType.formattedName)
            }
            if layout == .indicatorNext || layout == .indicatorPrevious {
                components.append(isFullWidth ? "FullWidth" : "NotFullWidth")
            }
            return components.joined(separator: " · ")
        }
    }

    /// Builds the grid cell for a given link variant.
    @MainActor private func linkVariantCell(
        _ variant: LinkVariant,
        theme: MISOTheme,
        layout: LinkLayout,
        size: MISOLink.Size,
        density: MISOLink.Density,
        onColoredSurface: Bool) -> SnapshotGridCell<AnyView>
    {
        SnapshotGridCell(caption: variant.caption(layout: layout)) {
            AnyView(
                MISOThemeableView(theme: theme) {
                    LinkTest(layout: layout,
                             size: size,
                             density: density,
                             iconType: variant.iconType,
                             onColoredSurface: onColoredSurface,
                             isFullWidth: variant.isFullWidth)
                        .disabled(variant.disabled)
                })
        }
    }

    /// Builds a ``SnapshotGrid`` gathering all relevant `disabled`, `iconType` and `isFullWidth` combinations
    /// for a given link configuration, then captures it in a single snapshot.
    ///
    /// The snapshot is saved with a name based on the parameters which are not folded into the grid:
    ///    test_<themeName>_<colorScheme>.<coloredSurfacePattern><layout>_<size>_<density>
    ///
    /// - Parameters:
    ///   - theme: The theme (MISOTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - layout: the layout of the link
    ///   - size: the size of the link
    ///   - density: the density of the link
    ///   - onColoredSurface: a flag to know if link is on a colored surface or not
    @MainActor private func testLinkGrid(theme: MISOTheme,
                                         interfaceStyle: UIUserInterfaceStyle,
                                         layout: LinkLayout,
                                         size: MISOLink.Size,
                                         density: MISOLink.Density,
                                         onColoredSurface: Bool)
    {
        let cells = LinkVariant.all(for: layout).map {
            linkVariantCell($0, theme: theme, layout: layout, size: size, density: density, onColoredSurface: onColoredSurface)
        }

        // Create a unique snapshot name based on the current configuration :
        // test_<themeName>_<colorScheme>.<coloredSurfacePattern><layout>_<size>_<density> where:
        // - `coloredSurfacePattern` is empty if not on colored surface
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let coloredSurfacePatern = onColoredSurface ? "ColoredSurface_" : ""
        let name = "\(coloredSurfacePatern)\(layout.debugDescription)_\(size.formattedName)_\(density.formattedName)"

        let grid = SnapshotGrid(
            columns: Self.gridColumns,
            cellSize: Self.gridCellSize,
            cells: cells,
            title: "\(testName).\(name)")

        // Generate the illustration for the specified configuration
        let illustration = MISOThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Capture the snapshot of the grid with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    /// This function tests the `MISOLink` skeleton state (default configuration) for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testLinkSkeleton(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Generate the illustration for the specified configuration
        let illustration = MISOThemeableView(theme: theme) {
            MISOLink(text: "Link") {}
                .showSkeleton(isVisible: true, isAnimated: false)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "testLinkSkeleton_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "LinkSkeleton"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit

// MARK: - Link Test

struct LinkTest: View {

    let layout: LinkLayout
    let size: MISOLink.Size
    let density: MISOLink.Density
    let iconType: DefinedStatusIcons
    let onColoredSurface: Bool
    let isFullWidth: Bool

    @Environment(\.theme) private var theme

    var body: some View {
        if onColoredSurface {
            MISOColoredSurface(color: theme.colorModes.onBrandPrimary, content: link)
        } else {
            link()
        }
    }

    func link() -> some View {
        switch layout {
        case .textOnly:
            MISOLink(text: "Link", size: size, density: density) {}
        case .textAndIcon:
            MISOLink(text: "Link", image: misoImage, size: size, density: density) {}
        case .indicatorNext:
            MISOLink(text: "Next", indicator: .next, size: size, density: density, isFullWidth: isFullWidth) {}
        case .indicatorPrevious:
            MISOLink(text: "Back", indicator: .previous, size: size, density: density, isFullWidth: isFullWidth) {}
        case .indicatorExternal:
            MISOLink(text: "External", indicator: .external, size: size, density: density) {}
        }
    }

    private var misoImage: MISOImage {
        let asset: Image = iconType == .tintedIcon ? Image(decorative: "ic_heart") : Image.placeholderImage()
        let renderingMode: Image.TemplateRenderingMode = iconType == .tintedIcon ? .template : .original
        return MISOImage(asset: asset, renderingMode: renderingMode)
    }
}

extension MISOLink.Size: @retroactive CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .small:
            "Small"
        case .default:
            "Medium"
        }
    }
}

extension LinkLayout: CustomDebugStringConvertible {
    public var debugDescription: String {
        switch self {
        case .textOnly:
            "TextOnly"
        case .textAndIcon:
            "IconAndText"
        case .indicatorPrevious:
            "IndicatorPrevious"
        case .indicatorNext:
            "IndicatorNext"
        case .indicatorExternal:
            "IndicatorExternal"
        }
    }
}
