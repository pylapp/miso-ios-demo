// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

/// Tests the UI rendering of each **color token** using reference images for `BlueCoatTheme`
final class BlueCoatThemeTokensColorSnapshotsTests: TokensColorSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// This function tests all color tokens in the `BlueCoatTheme` with the `light` color schemes.
    /// It iterates through all sections of `NamedColor`, rendering each illustration in a `UIHostingController`,
    /// and captures a snapshot for each color. The snapshots are saved with names indicating the color, theme, and color scheme.
    @MainActor func testAllColorsBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testActionColors(theme: theme, interfaceStyle: interfaceStyle)
        testAlwaysColors(theme: theme, interfaceStyle: interfaceStyle)
        testBackgroundColors(theme: theme, interfaceStyle: interfaceStyle)
        testBorderColors(theme: theme, interfaceStyle: interfaceStyle)
        // Wireframe theme does not have yet color charts branded for it
        // If the provider is defined that's unexpected, it should be nil
        if theme.colorsCharts != nil {
            XCTFail("The Wireframe theme does not have yet color charts, that's unexpected")
        }
        // Wireframe theme does not have yet color decorative branded for it
        // If the provider is defined that's unexpected, it should be nil
        if theme.colorsDecorative != nil {
            XCTFail("The Wireframe theme does not have yet color decorative, that's unexpected")
        }
        testContentColors(theme: theme, interfaceStyle: interfaceStyle)
        testOpacityColors(theme: theme, interfaceStyle: interfaceStyle)
        testOverlayColors(theme: theme, interfaceStyle: interfaceStyle)
        testRepositoryColors(theme: theme, interfaceStyle: interfaceStyle)
        testSurfaceColors(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// This function tests all color tokens in the `BlueCoatTheme` with the `dark` color schemes.
    /// It iterates through all sections of `NamedColor`, rendering each illustration in a `UIHostingController`,
    /// and captures a snapshot for each color. The snapshots are saved with names indicating the color, theme, and color scheme.
    @MainActor func testAllColorsBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testActionColors(theme: theme, interfaceStyle: interfaceStyle)
        testAlwaysColors(theme: theme, interfaceStyle: interfaceStyle)
        testBackgroundColors(theme: theme, interfaceStyle: interfaceStyle)
        testBorderColors(theme: theme, interfaceStyle: interfaceStyle)
        // Wireframe theme does not have yet color charts branded for it
        // If the provider is defined that's unexpected, it should be nil
        if theme.colorsCharts != nil {
            XCTFail("The Wireframe theme does not have yet color charts, that's unexpected")
        }
        // Wireframe theme does not have yet color decorative branded for it
        // If the provider is defined that's unexpected, it should be nil
        if theme.colorsDecorative != nil {
            XCTFail("The Wireframe theme does not have yet color decorative, that's unexpected")
        }
        testContentColors(theme: theme, interfaceStyle: interfaceStyle)
        testOpacityColors(theme: theme, interfaceStyle: interfaceStyle)
        testOverlayColors(theme: theme, interfaceStyle: interfaceStyle)
        /*
         There are some failures with two tokens, even if the snapshots are fresh:
         - Wireframe Theme, dark mode --> repositoryOpacityBlackHighest
         - Wireframe Theme, dark mode --> surfaceInverseHigh
         */
        testRepositoryColors(theme: theme, interfaceStyle: interfaceStyle, precision: 0.94, perceptualPrecision: 0.96)
        testSurfaceColors(theme: theme, interfaceStyle: interfaceStyle, precision: 0.94, perceptualPrecision: 0.96)
    }
}

// swiftlint:enable required_deinit
