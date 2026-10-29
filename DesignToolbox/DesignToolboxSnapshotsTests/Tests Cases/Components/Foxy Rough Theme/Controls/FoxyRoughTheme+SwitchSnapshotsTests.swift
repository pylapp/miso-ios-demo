// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOSwitch` and `MISOSwitchItem` for each parameter  for `FoxyRoughTheme`.
final class FoxyRoughThemeSwitchSnapshotsTests: SwitchSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all switches configuration in the `FoxyRoughTheme` with the `light` color schemes.
    @MainActor func testAllSwitchesFoxyRoughThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllSwitches(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all switches configuration in the `FoxyRoughTheme` with the `dark` color schemes.
    @MainActor func testAllSwitchesFoxyRoughThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllSwitches(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests the `MISOSwitch` skeleton state in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testSwitchSkeletonFoxyRoughThemeLight() {
        testSwitchSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `MISOSwitch` skeleton state in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testSwitchSkeletonFoxyRoughThemeDark() {
        testSwitchSkeleton(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
