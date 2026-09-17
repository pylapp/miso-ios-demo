// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOBadgeStandard`, `MISOBadgeIcon` and `MISOBadgeCount` components for each parameter with `FoxyRoughTheme`
final class FoxyRoughThemeBadgeSnapshotsTests: BadgeSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all badges configuration in the `FoxyRoughTheme` with the `light` color schemes.
    @MainActor func testAllBadgesFoxyRoughThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllBadges(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all badges configuration in the `FoxyRoughTheme` with the `dark` color schemes.
    @MainActor func testAllBadgesFoxyRoughThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllBadges(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
