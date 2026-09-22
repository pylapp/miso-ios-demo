// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOAlertMessage` components for each parameter with `FoxyRoughTheme`
final class FoxyRoughThemeAlertMessageSnapshotsTests: AlertMessageSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all alert messages configurations in the `FoxyRoughTheme` with the `light` color schemes.
    @MainActor func testAllAlertMessageFoxyRoughThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllAlertMessages(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all alert messages configurations in the `FoxyRoughTheme` with the `dark` color schemes.
    @MainActor func testAllAlertMessagesFoxyRoughThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllAlertMessages(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
