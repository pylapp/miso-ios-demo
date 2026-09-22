// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOInlineAlert` components for each parameter with `BlueCoatTheme`
final class BlueCoatThemeInlineAlertSnapshotsTests: InlineAlertSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// Tests all alert messages configurations in the `BlueCoatTheme` with the `light` color schemes.
    @MainActor func testAllInlineAlertBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllInlineAlerts(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all alert messages configurations in the `BlueCoatTheme` with the `dark` color schemes.
    @MainActor func testAllInlineAlertsBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllInlineAlerts(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
