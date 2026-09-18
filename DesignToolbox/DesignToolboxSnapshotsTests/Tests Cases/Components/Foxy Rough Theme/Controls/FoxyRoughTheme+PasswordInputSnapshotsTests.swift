// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit
// swiftlint:disable type_name

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOPasswordInput` and `MISOPasswordInputItem` for each parameter  for `FoxyRoughTheme`.
final class FoxyRoughThemePasswordInputSnapshotsTests: PasswordInputSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all password inputs configurations in the `FoxyRoughTheme` with the `light` color schemes.
    @MainActor func testAllPasswordInputsFoxyRoughThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllPasswordInputs(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all password inputs configurations in the `FoxyRoughTheme` with the `dark` color schemes.
    @MainActor func testAllPasswordInputsFoxyRoughThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllPasswordInputs(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
// swiftlint:enable type_name
