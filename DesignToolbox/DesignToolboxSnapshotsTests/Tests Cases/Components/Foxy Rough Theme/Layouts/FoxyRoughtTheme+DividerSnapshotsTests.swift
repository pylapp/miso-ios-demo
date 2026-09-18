// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOHorizontalDivider` and `MISOVerticalDivider` for each parameter  for `FoxyRoughTheme`.
final class FoxyRoughThemeDividerSnapshotsTests: DividerSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all divider configuration in the `FoxyRoughTheme` with the `light` color schemes.
    @MainActor func testAllDividerFoxyRoughThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllDividers(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `FoxyRoughTheme` with the `dark` color schemes.
    @MainActor func testAllDividerFoxyRoughThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllDividers(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
