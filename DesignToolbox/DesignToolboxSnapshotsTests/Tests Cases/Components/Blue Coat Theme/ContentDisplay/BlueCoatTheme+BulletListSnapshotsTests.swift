// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOBulletList` components for each parameter with `BlueCoatTheme`
final class BlueCoatThemeBulletListSnapshotsTests: BulletListSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// Tests all bullet lists configuration in the `BlueCoatTheme` with the `light` color schemes.
    @MainActor func testAllBulletListsBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllBulletLists(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all bullet lists configuration in the `BlueCoatTheme` with the `dark` color schemes.
    @MainActor func testAllBulletListsBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllBulletLists(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
