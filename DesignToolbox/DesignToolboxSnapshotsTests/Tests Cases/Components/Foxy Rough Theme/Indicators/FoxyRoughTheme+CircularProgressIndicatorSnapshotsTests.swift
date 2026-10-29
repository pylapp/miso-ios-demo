// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit
// swiftlint:disable type_name

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOCircularProgressIndicator` for each parameter with `FoxyRoughTheme`.
final class FoxyRoughThemeCircularProgressIndicatorSnapshotsTests: CircularProgressIndicatorSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all circular progress indicators configuration in the `FoxyRoughTheme` with the `light` color schemes.
    @MainActor func testAllCircularProgressIndicatorsFoxyRoughThemeLight() {
        testAllCircularProgressIndicators(theme: theme, interfaceStyle: .light)
    }

    /// Tests all circular progress indicators configuration in the `FoxyRoughTheme` with the `dark` color schemes.
    @MainActor func testAllCircularProgressIndicatorsFoxyRoughThemeDark() {
        testAllCircularProgressIndicators(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable type_name
// swiftlint:enable required_deinit
