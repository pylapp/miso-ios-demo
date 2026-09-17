// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOButton` for each parameter for `FoxyRoughTheme`.
final class FoxyRoughThemeButtonSnapshotsTests: ButtonSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all buttons configuration in the `FoxyRoughTheme` with the `light` color schemes.
    @MainActor func testAllButtonsFoxyRoughThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllButtons(theme: theme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all buttons configuration in the `FoxyRoughTheme` with the `dark` color schemes.
    @MainActor func testAllButtonsFoxyRoughThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllButtons(theme: theme, interfaceStyle: interfaceStyle)
        testAllButtonsOnColoredSurface(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
