// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISORadio` and `MISORadioItem` for each parameter  for `FoxyRoughTheme`.
final class FoxyRoughThemeRadioSnapshotsTests: RadioButtonSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all buttons configuration in the `FoxyRoughTheme` with the `light` color schemes.
    @MainActor func testAllRadioButtonsFoxyRoughThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllRadioButtons(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `FoxyRoughTheme` with the `dark` color schemes.
    @MainActor func testAllRadioButtonsFoxyRoughThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllRadioButtons(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
