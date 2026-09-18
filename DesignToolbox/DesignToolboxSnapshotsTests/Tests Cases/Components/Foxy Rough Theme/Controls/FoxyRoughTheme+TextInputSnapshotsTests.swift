// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSTextInput` and `OUDSTextInputItem` for each parameter  for `FoxyRoughTheme`.
final class FoxyRoughThemeTextInputSnapshotsTests: TextInputSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all switches configuration in the `FoxyRoughTheme` with the `light` color schemes.
    @MainActor func testAllTextInputsFoxyRoughThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllTextInputs(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all switches configuration in the `FoxyRoughTheme` with the `dark` color schemes.
    @MainActor func testAllTextInputsFoxyRoughThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllTextInputs(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
