// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOPasswordInput` for each parameter for `BlueCoatTheme`.
final class BlueCoatThemePasswordInputSnapshotsTests: PasswordInputSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// Tests all password inputs configurations in the `BlueCoatTheme` with the `light` color schemes.
    @MainActor func testAllPasswordInputsBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllPasswordInputs(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all password inputs configurations in the `BlueCoatTheme` with the `dark` color schemes.
    @MainActor func testAllPasswordInputsBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllPasswordInputs(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests the `MISOPasswordInput` skeleton state in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testPasswordInputSkeletonBlueCoatThemeLight() {
        testPasswordInputSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `MISOPasswordInput` skeleton state in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testPasswordInputSkeletonBlueCoatThemeDark() {
        testPasswordInputSkeleton(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
