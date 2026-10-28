// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

/// Tests the UI rendering of the `MISOTag` for each parameter with `FoxyRoughTheme`.
final class FoxyRoughThemeTagSnapshotsTests: TagSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all tags configuration in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testAllTagsFoxyRoughThemeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testAllTagsFoxyRoughThemeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testAllInputTagsFoxyRoughThemeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllInputTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testAllInputTagsFoxyRoughThemeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllInputTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests the `MISOTag` skeleton state in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testTagSkeletonFoxyRoughThemeLight() {
        testTagSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `MISOTag` skeleton state in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testTagSkeletonFoxyRoughThemeDark() {
        testTagSkeleton(theme: theme, interfaceStyle: .dark)
    }

    /// Tests the `MISOInputTag` skeleton state in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testInputTagSkeletonFoxyRoughThemeLight() {
        testInputTagSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `MISOInputTag` skeleton state in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testInputTagSkeletonFoxyRoughThemeDark() {
        testInputTagSkeleton(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
