// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of `MISOStaticListItem` and `MISONavigationListItem` for each parameter for `BlueCoatTheme`.
final class BlueCoatThemeListItemSnapshotsTests: ListItemSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    // MARK: Styles

    /// Tests all content styles in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testAllStylesBlueCoatThemeLight() {
        testAllStyles(theme: theme, interfaceStyle: .light)
    }

    /// Tests all content styles in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testAllStylesBlueCoatThemeDark() {
        testAllStyles(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Alignments

    /// Tests all alignments in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testAllAlignmentsBlueCoatThemeLight() {
        testAllAlignments(theme: theme, interfaceStyle: .light)
    }

    /// Tests all alignments in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testAllAlignmentsBlueCoatThemeDark() {
        testAllAlignments(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Sizes

    /// Tests all sizes in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testAllSizesBlueCoatThemeLight() {
        testAllSizes(theme: theme, interfaceStyle: .light)
    }

    /// Tests all sizes in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testAllSizesBlueCoatThemeDark() {
        testAllSizes(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Rounded media

    /// Tests rounded media in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testRoundedMediaBlueCoatThemeLight() {
        testRoundedMedia(theme: theme, interfaceStyle: .light)
    }

    /// Tests rounded media in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testRoundedMediaBlueCoatThemeDark() {
        testRoundedMedia(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Leadings

    /// Tests all leading elements in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testAllLeadingsBlueCoatThemeLight() {
        testAllLeadings(theme: theme, interfaceStyle: .light)
    }

    /// Tests all leading elements in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testAllLeadingsBlueCoatThemeDark() {
        testAllLeadings(theme: theme, interfaceStyle: .dark)
    }

    // MARK: Trailings

    /// Tests all trailing elements in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testAllTrailingsBlueCoatThemeLight() {
        testAllTrailings(theme: theme, interfaceStyle: .light)
    }

    /// Tests all trailing elements in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testAllTrailingsBlueCoatThemeDark() {
        testAllTrailings(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
