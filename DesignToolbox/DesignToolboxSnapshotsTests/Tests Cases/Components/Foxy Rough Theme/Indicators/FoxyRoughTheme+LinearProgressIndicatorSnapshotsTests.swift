// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit
// swiftlint:disable type_name

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOLinearProgressIndicator` for each parameter with `FoxyRoughTheme`.
final class FoxyRoughThemeLinearProgressIndicatorSnapshotsTests: LinearProgressIndicatorSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all linear progress indicators configuration in the `FoxyRoughTheme` with the `light` color schemes.
    @MainActor func testAllLinearProgressIndicatorsFoxyRoughThemeLight() {
        testAllLinearProgressIndicators(theme: theme, interfaceStyle: .light)
    }

    /// Tests all linear progress indicators configuration in the `FoxyRoughTheme` with the `dark` color schemes.
    @MainActor func testAllLinearProgressIndicatorsFoxyRoughThemeDark() {
        testAllLinearProgressIndicators(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable type_name
// swiftlint:enable required_deinit
