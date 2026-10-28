// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISODisplay`, `MISOHeading`, `MISOBody`, `MISOLabel` and `MISOCode`
/// typography components for each parameter with `FoxyRoughTheme`.
final class FoxyRoughThemeTypographySnapshotsTests: TypographySnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    @MainActor func testAllTypographyFoxyRoughThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllTypography(theme: theme, interfaceStyle: interfaceStyle)
    }

    @MainActor func testAllTypographyFoxyRoughThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllTypography(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
