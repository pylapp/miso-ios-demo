// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOCheckboxIndeterminate` and `MISOCheckboxItemIndeterminate` for each parameter.
/// `MISOCheckbox` and `MISOCheckboxItem` won't be tested as, until today, are based on the same layouts and look and feels, and the only difference
/// is in the management of the states. Uses `FoxyRoughTheme`.
final class FoxyRoughThemeCheckboxSnapshotsTests: CheckboxSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all buttons configuration in the `FoxyRoughTheme` with the `light` color schemes.
    @MainActor func testAllCheckboxesFoxyRoughThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllCheckboxes(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `FoxyRoughTheme` with the `dark` color schemes.
    @MainActor func testAllCheckboxesFoxyRoughThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllCheckboxes(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
