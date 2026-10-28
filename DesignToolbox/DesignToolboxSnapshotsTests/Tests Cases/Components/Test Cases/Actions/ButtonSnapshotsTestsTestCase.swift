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

/// Tests the UI rendering of the `MISOButton` for each parameter
///
/// To limit the amount of reference images, the `disabled`, `a11yContrast`, `flipIcon` and `imageMode`
/// axes are not given a dedicated reference image each: they are gathered into a single ``SnapshotGrid``
/// per (theme, color scheme, tuning, surface, size, appearance, layout) combination, with one assertion
/// (and so one reference image) per grid. Each cell of the grid carries a short caption so a regression
/// stays identifiable directly in the resulting image. See `SnapshotGrid.swift`.
open class ButtonSnapshotsTestsTestCase: XCTestCase {

    /// The number of columns used to lay out the combinatorial grid for a button configuration.
    private static let gridColumns = 4

    /// Fixed size applied to each cell of the grid, so the resulting image has a stable, reproducible size.
    private static let gridCellSize = CGSize(width: 140, height: 72)

    /// This function tests all buttons configuration for the given theme and color schemes on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    /// **The loading style is not tested yet as we face troubles with animations and snapshots.**
    ///
    /// It iterates through all button `appearance`, for all `style` with *textOnly, textAndIcon and iconOnly* layouts.
    /// For each of these combinations, a single grid image gathers the `enabled/disabled`, `normal/high contrast`,
    /// `flipIcon` and `imageMode` variations.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testAllButtons(
        theme: MISOTheme,
        interfaceStyle: UIUserInterfaceStyle)
    {
        for size in MISOButton.Size.allCases {
            for appearance in MISOButton.Appearance.allCases {
                for layout in ButtonTest.Layout.allCases {
                    testButtonGrid(
                        theme: theme,
                        interfaceStyle: interfaceStyle,
                        layout: layout,
                        appearance: appearance,
                        size: size,
                        onColoredSurface: false)
                }
            }
        }
    }

    /// This function tests all buttons configuration for the given theme and color schemes on a colored surface
    /// (the `surfaceBrandPrimary` token).
    ///
    /// **/!\ It does not test the hover and pressed states.**
    /// **The loading style is not tested yet as we face troubles with animations and snapshots.**
    ///
    /// It iterates through all button `appearance`, for all `style` with *textOnly, textAndIcon and iconOnly layouts*.
    /// For each of these combinations, a single grid image gathers the `enabled/disabled`, `normal/high contrast`,
    /// `flipIcon` and `imageMode` variations.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllButtonsOnColoredSurface(
        theme: MISOTheme,
        interfaceStyle: UIUserInterfaceStyle)
    {
        // Skip test for negative and brand appearance because it is not allowed on colored surface
        for size in MISOButton.Size.allCases {
            for appearance in MISOButton.Appearance.allCases
                where appearance != .negative && appearance != .brand
            {
                for layout in ButtonTest.Layout.allCases {
                    testButtonGrid(
                        theme: theme,
                        interfaceStyle: interfaceStyle,
                        layout: layout,
                        appearance: appearance,
                        size: size,
                        onColoredSurface: true)
                }
            }
        }
    }

    /// A single configuration of `disabled`/`a11yContrast`/`flipIcon`/`imageMode` to fold into a grid cell.
    private struct ButtonVariant {
        let disabled: Bool
        let a11yContrast: UIAccessibilityContrast
        let flipIcon: Bool
        let imageMode: Image.TemplateRenderingMode

        /// All the `disabled` x `a11yContrast` x `flipIcon` x `imageMode` combinations.
        static let all: [ButtonVariant] = [false, true].flatMap { disabled in
            [UIAccessibilityContrast.normal, .high].flatMap { a11yContrast in
                [false, true].flatMap { flipIcon in
                    [Image.TemplateRenderingMode.original, .template].map { imageMode in
                        ButtonVariant(disabled: disabled, a11yContrast: a11yContrast, flipIcon: flipIcon, imageMode: imageMode)
                    }
                }
            }
        }

        /// Short caption identifying the variant, displayed under its grid cell.
        var caption: String {
            [
                disabled ? "Disabled" : "Enabled",
                a11yContrast == .high ? "HighContrast" : "NormalContrast",
                flipIcon ? "Flip" : "NoFlip",
                imageMode == .original ? "Original" : "Template",
            ].joined(separator: " · ")
        }
    }

    /// Builds the grid cell for a given button variant.
    ///
    /// `ContrastOverride` embeds its content in a dedicated `UIHostingController` to isolate the
    /// accessibility contrast trait per cell: the SwiftUI environment set by the outer
    /// `MISOThemeableView` does not cross that boundary, so the theme must be re-injected here.
    @MainActor private func buttonVariantCell(
        _ variant: ButtonVariant,
        theme: MISOTheme,
        layout: ButtonTest.Layout,
        appearance: MISOButton.Appearance,
        size: MISOButton.Size,
        onColoredSurface: Bool) -> SnapshotGridCell<AnyView>
    {
        SnapshotGridCell(caption: variant.caption) {
            AnyView(
                ContrastOverride(
                    contrast: variant.a11yContrast,
                    content: MISOThemeableView(theme: theme) {
                        ButtonTest(
                            layout: layout,
                            flipIcon: variant.flipIcon,
                            imageMode: variant.imageMode,
                            appearance: appearance,
                            style: .default,
                            size: size,
                            onColoredSurface: onColoredSurface)
                            .disabled(variant.disabled)
                    }))
        }
    }

    /// Builds a ``SnapshotGrid`` gathering all `disabled`, `a11yContrast`, `flipIcon` and `imageMode`
    /// combinations for a given button configuration, then captures it in a single snapshot.
    ///
    /// The snapshot is saved with a name based on the parameters which are not folded into the grid.
    ///
    /// - Parameters:
    ///   - theme: The theme (MISOTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - layout: the layout of the button
    ///   - appearance: the appearance of the button
    ///   - size: the size of the button
    ///   - onColoredSurface: a flag to know if button is on a colored surface or not
    @MainActor private func testButtonGrid(
        theme: MISOTheme,
        interfaceStyle: UIUserInterfaceStyle,
        layout: ButtonTest.Layout,
        appearance: MISOButton.Appearance,
        size: MISOButton.Size,
        onColoredSurface: Bool = false)
    {
        let cells = ButtonVariant.all.map {
            buttonVariantCell(
                $0,
                theme: theme,
                layout: layout,
                appearance: appearance,
                size: size,
                onColoredSurface: onColoredSurface)
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let coloredSurfacePatern = onColoredSurface ? "ColoredSurface_" : ""
        let roundedPattern = theme.tuning.hasRoundedButtons ? "_Rounded" : ""
        let sizePattern = size == .small ? "_Small" : ""
        let name = "\(coloredSurfacePatern)\(layout.rawValue.camelCase)_\(appearance.formattedName)_" +
            "\(ButtonStyle.default.formattedName)\(sizePattern)\(roundedPattern)"

        let grid = SnapshotGrid(
            columns: Self.gridColumns,
            cellSize: Self.gridCellSize,
            cells: cells,
            title: "\(testName).\(name)")

        // Generate the illustration for the specified configuration
        let illustration = MISOThemeableView(theme: theme) {
            grid
                .background(
                    theme.colors.bgPrimary.color(
                        for: interfaceStyle == .light ? .light : .dark))
        }

        // Capture the snapshot of the grid with the correct user interface style and save it with the snapshot name
        assertIllustration(
            illustration,
            on: interfaceStyle,
            named: name,
            testName: testName)
    }

    /// This function tests the `MISOButton` skeleton state (default configuration) for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testButtonSkeleton(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Generate the illustration for the specified configuration
        let illustration = MISOThemeableView(theme: theme) {
            MISOButton(text: "Button", appearance: .default, style: .default, size: .default) {}
                .showSkeleton(isVisible: true, isAnimated: false)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "testButton_skeleton_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "ButtonSkeleton"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// MARK: - Button Test

struct ButtonTest: View {

    enum Layout: String, CaseIterable {
        case text
        case textAndIcon
        case icon
    }

    let layout: Layout
    let flipIcon: Bool
    let imageMode: Image.TemplateRenderingMode
    let appearance: MISOButton.Appearance
    let style: MISOButton.Style
    let size: MISOButton.Size
    let onColoredSurface: Bool

    @Environment(\.theme) private var theme

    var body: some View {
        if onColoredSurface {
            MISOColoredSurface(
                color: theme.colorModes.onBrandPrimary,
                content: button)
        } else {
            button()
        }
    }

    func button() -> some View {
        switch layout {
        case .text:
            MISOButton(text: "Button", appearance: appearance, style: style, size: size) {}
        case .textAndIcon:
            MISOButton(
                text: "Button",
                image: misoImage,
                appearance: appearance,
                style: style,
                size: size) {}
        case .icon:
            MISOButton(
                image: MISOImage(asset: imageMode == .original ? Image.placeholderImage() : Image.defaultImage(),
                                 flipped: flipIcon,
                                 accessibilityLabel: "Icon",
                                 renderingMode: imageMode),
                appearance: appearance,
                style: style,
                size: size) {}
        }
    }

    private var misoImage: MISOImage {
        MISOImage(asset: imageMode == .original ? Image.placeholderImage() : Image.defaultImage(),
                  flipped: flipIcon,
                  renderingMode: imageMode)
    }
}

// swiftlint:enable required_deinit
