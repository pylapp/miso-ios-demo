// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOBadgeStandard`, `MISOBadgeIcon` and `MISOBadgeCount` components for each parameter with `BlueCoatTheme`
final class BlueCoatThemeBadgeSnapshotsTests: BadgeSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// Tests all badges configuration in the `BlueCoatTheme` with the `light` color schemes.
    @MainActor func testAllBadgesBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllBadges(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all badges configuration in the `BlueCoatTheme` with the `dark` color schemes.
    @MainActor func testAllBadgesBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllBadges(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
