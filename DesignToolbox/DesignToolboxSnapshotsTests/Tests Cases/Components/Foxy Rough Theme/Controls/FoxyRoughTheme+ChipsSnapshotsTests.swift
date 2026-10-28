// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

/// Tests the UI rendering of the `MISOFilterChip` and `MISOSuggestionChip` for each parameter.
final class FoxyRoughThemeChipsSnapshotsTests: ChipsSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all chips configuration in the `FoxyRoughTheme` with the `light` color schemes.
    @MainActor func testAllChipsFoxyRoughThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllChips(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all chips configuration in the `FoxyRoughTheme` with the `dark` color schemes.
    @MainActor func testAllChipsFoxyRoughThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllChips(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests the `MISOFilterChip` and `MISOSuggestionChip` skeleton states in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testChipsSkeletonFoxyRoughThemeLight() {
        testSuggestionChipSkeleton(theme: theme, interfaceStyle: .light)
        testFilterChipSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `MISOFilterChip` and `MISOSuggestionChip` skeleton states in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testChipsSkeletonFoxyRoughThemeDark() {
        testSuggestionChipSkeleton(theme: theme, interfaceStyle: .dark)
        testFilterChipSkeleton(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
