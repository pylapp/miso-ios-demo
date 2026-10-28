// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit
// swiftlint:disable type_name

/// Tests the UI rendering of the `MISOCategoricalTag` for each parameter with `FoxyRoughTheme`.
final class FoxyRoughThemeCategoricalTagSnapshotsTests: CategoricalTagSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all categorical tags configuration in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testAllCategoricalTagsFoxyRoughThemeThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllCategoricalTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all categorical tags configuration in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testAllCategoricalTagsFoxyRoughThemeThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllCategoricalTags(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable type_name
// swiftlint:enable required_deinit
