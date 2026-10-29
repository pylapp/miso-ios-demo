// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

/// Tests the UI rendering of the `MISOTag` for each parameter with `BlueCoatTheme`.
final class BlueCoatThemeTagSnapshotsTests: TagSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// Tests all tags configuration in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testAllTagsBlueCoatThemeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testAllTagsBlueCoatThemeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testAllInputTagsBlueCoatThemeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllInputTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testAllInputTagsBlueCoatThemeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllInputTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests the `MISOTag` skeleton state in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testTagSkeletonBlueCoatThemeLight() {
        testTagSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `MISOTag` skeleton state in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testTagSkeletonBlueCoatThemeDark() {
        testTagSkeleton(theme: theme, interfaceStyle: .dark)
    }

    /// Tests the `MISOInputTag` skeleton state in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testInputTagSkeletonBlueCoatThemeLight() {
        testInputTagSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `MISOInputTag` skeleton state in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testInputTagSkeletonBlueCoatThemeDark() {
        testInputTagSkeleton(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
