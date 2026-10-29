// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOTextInput` for each parameter for `BlueCoatTheme`.
final class BlueCoatThemeTextInputSnapshotsTests: TextInputSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// Tests all switches configuration in the `BlueCoatTheme` with the `light` color schemes.
    @MainActor func testAllTextInputsBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllTextInputs(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all switches configuration in the `BlueCoatTheme` with the `dark` color schemes.
    @MainActor func testAllTextInputsBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllTextInputs(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests the `MISOTextInput` skeleton state in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testTextInputSkeletonBlueCoatThemeLight() {
        testTextInputSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `MISOTextInput` skeleton state in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testTextInputSkeletonBlueCoatThemeDark() {
        testTextInputSkeleton(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
