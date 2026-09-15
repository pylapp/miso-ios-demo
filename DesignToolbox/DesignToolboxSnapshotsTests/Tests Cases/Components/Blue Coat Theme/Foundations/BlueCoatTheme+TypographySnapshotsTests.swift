// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISODisplay`, `MISOHeading`, `MISOBody`, `MISOLabel` and `MISOCode`
/// typography components for each parameter with `BlueCoatTheme`.
final class BlueCoatThemeTypographySnapshotsTests: TypographySnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    @MainActor func testAllTypographyBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllTypography(theme: theme, interfaceStyle: interfaceStyle)
    }

    @MainActor func testAllTypographyBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllTypography(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
