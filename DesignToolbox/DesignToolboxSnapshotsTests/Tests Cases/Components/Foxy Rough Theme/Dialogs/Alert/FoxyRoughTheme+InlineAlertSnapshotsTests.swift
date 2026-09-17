// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOInlineAlert` components for each parameter with `FoxyRoughTheme`
final class FoxyRoughThemeInlineAlertSnapshotsTests: InlineAlertSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all alert messages configurations in the `FoxyRoughTheme` with the `light` color schemes.
    @MainActor func testAllInlineAlertFoxyRoughThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllInlineAlerts(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all alert messages configurations in the `FoxyRoughTheme` with the `dark` color schemes.
    @MainActor func testAllInlineAlertsFoxyRoughThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllInlineAlerts(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
