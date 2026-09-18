// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOSwitch` and `MISOSwitchItem` for each parameter  for `BlueCoatTheme`.
final class BlueCoatThemeSwitchSnapshotsTests: SwitchSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// Tests all switches configuration in the `BlueCoatTheme` with the `light` color schemes.
    @MainActor func testAllSwitchesBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllSwitches(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all switches configuration in the `BlueCoatTheme` with the `dark` color schemes.
    @MainActor func testAllSwitchesBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllSwitches(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
