// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

/// Tests the UI rendering of the `MISOTag` for each parameter with `BlueCoatTheme`.
final class BlueCoatThemeTagSnapshotsTests: TagSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// Tests all tags configuration in the `Wireframe` with the `light` color scheme.
    @MainActor func testAllTagsBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `Wireframe` with the `dark` color scheme.
    @MainActor func testAllTagsBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `Wireframe` with the `light` color scheme.
    @MainActor func testAllInputTagsBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllInputTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all tags configuration in the `Wireframe` with the `dark` color scheme.
    @MainActor func testAllInputTagsBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllInputTags(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
