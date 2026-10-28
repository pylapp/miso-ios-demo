// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOButton` for each parameter for `BlueCoatTheme`.
final class BlueCoatThemeButtonSnapshotsTests: ButtonSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// Tests all buttons configuration in the `BlueCoatTheme` with the `light` color schemes.
    @MainActor func testAllButtonsBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllButtons(theme: theme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `BlueCoatTheme` with the `dark` color schemes.
    @MainActor func testAllButtonsBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllButtons(theme: theme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: theme, interfaceStyle: interfaceStyle)
    }

    // MARK: Skeleton

    /// Tests the `MISOButton` skeleton state in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testButtonSkeletonBlueCoatThemeLight() {
        testButtonSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `MISOButton` skeleton state in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testButtonSkeletonBlueCoatThemeDark() {
        testButtonSkeleton(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
