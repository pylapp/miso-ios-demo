// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit
// swiftlint:disable type_name

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOCircularProgressIndicator` for each parameter with `BlueCoatTheme`.
final class BlueCoatThemeCircularProgressIndicatorSnapshotsTests: CircularProgressIndicatorSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// Tests all circular progress indicators configuration in the `BlueCoatTheme` with the `light` color schemes.
    @MainActor func testAllCircularProgressIndicatorsBlueCoatThemeLight() {
        testAllCircularProgressIndicators(theme: theme, interfaceStyle: .light)
    }

    /// Tests all circular progress indicators configuration in the `BlueCoatTheme` with the `dark` color schemes.
    @MainActor func testAllCircularProgressIndicatorsBlueCoatThemeDark() {
        testAllCircularProgressIndicators(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable type_name
// swiftlint:enable required_deinit
