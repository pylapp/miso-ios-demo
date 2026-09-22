// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOPinCodeInput` for each parameter for `BlueCoatTheme`.
final class BlueCoatThemePinCodeInputSnapshotsTests: PinCodeInputSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// Tests all pin code input configuration in the `BlueCoatTheme` with the `light` color schemes.
    @MainActor func testAllPinCodeInputsBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllPinCodeInputs(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all pin code input configuration in the `BlueCoatTheme` with the `dark` color schemes.
    @MainActor func testAllPinCodeInputsBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllPinCodeInputs(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
