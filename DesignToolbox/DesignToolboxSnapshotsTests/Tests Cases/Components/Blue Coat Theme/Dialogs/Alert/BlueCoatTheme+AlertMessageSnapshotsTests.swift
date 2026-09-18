// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOAlertMessage` components for each parameter with `BlueCoatTheme`
final class BlueCoatThemeAlertMessageSnapshotsTests: AlertMessageSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// Tests all alert messages configurations in the `BlueCoatTheme` with the `light` color schemes.
    @MainActor func testAllAlertMessageBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllAlertMessages(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all alert messages configurations in the `BlueCoatTheme` with the `dark` color schemes.
    @MainActor func testAllAlertMessagesBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllAlertMessages(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
