// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of `MISOStaticListItem` and `MISONavigationListItem` for each parameter for `FoxyRoughTheme`.
final class FoxyRoughThemeListItemSnapshotsTests: ListItemSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    // MARK: Styles

    /// Tests all content styles in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testAllStylesFoxyRoughThemeLight() {
        testAllStyles(theme: theme, interfaceStyle: .light)
    }

    /// Tests all content styles in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testAllStylesFoxyRoughThemeDark() {
        testAllStyles(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Alignments

    /// Tests all alignments in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testAllAlignmentsFoxyRoughThemeLight() {
        testAllAlignments(theme: theme, interfaceStyle: .light)
    }

    /// Tests all alignments in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testAllAlignmentsFoxyRoughThemeDark() {
        testAllAlignments(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Sizes

    /// Tests all sizes in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testAllSizesFoxyRoughThemeLight() {
        testAllSizes(theme: theme, interfaceStyle: .light)
    }

    /// Tests all sizes in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testAllSizesFoxyRoughThemeDark() {
        testAllSizes(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Rounded media

    /// Tests rounded media in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testRoundedMediaFoxyRoughThemeLight() {
        testRoundedMedia(theme: theme, interfaceStyle: .light)
    }

    /// Tests rounded media in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testRoundedMediaFoxyRoughThemeDark() {
        testRoundedMedia(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Leadings

    /// Tests all leading elements in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testAllLeadingsFoxyRoughThemeLight() {
        testAllLeadings(theme: theme, interfaceStyle: .light)
    }

    /// Tests all leading elements in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testAllLeadingsFoxyRoughThemeDark() {
        testAllLeadings(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Trailings

    /// Tests all trailing elements in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testAllTrailingsFoxyRoughThemeLight() {
        testAllTrailings(theme: theme, interfaceStyle: .light)
    }

    /// Tests all trailing elements in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testAllTrailingsFoxyRoughThemeDark() {
        testAllTrailings(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
