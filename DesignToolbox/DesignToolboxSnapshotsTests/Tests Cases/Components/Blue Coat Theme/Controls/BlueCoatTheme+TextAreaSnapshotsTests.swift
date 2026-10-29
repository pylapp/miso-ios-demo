// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOTextArea` for each parameter for `BlueCoatTheme`.
final class BlueCoatThemeTextAreaSnapshotsTests: TextAreaSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// Tests all text area configurations in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testAllTextAreasBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllTextAreas(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all text area configurations in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testAllTextAreasBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllTextAreas(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests the `MISOTextArea` skeleton state in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testTextAreaSkeletonBlueCoatThemeLight() {
        testTextAreaSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `MISOTextArea` skeleton state in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testTextAreaSkeletonBlueCoatThemeDark() {
        testTextAreaSkeleton(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
