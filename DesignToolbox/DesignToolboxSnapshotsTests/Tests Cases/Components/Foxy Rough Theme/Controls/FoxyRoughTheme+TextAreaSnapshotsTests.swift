// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOTextArea` for each parameter for `FoxyRoughTheme`.
final class FoxyRoughThemeTextAreaSnapshotsTests: TextAreaSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// Tests all text area configurations in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testAllTextAreasFoxyRoughThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllTextAreas(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all text area configurations in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testAllTextAreasFoxyRoughThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllTextAreas(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests the `MISOTextArea` skeleton state in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testTextAreaSkeletonFoxyRoughThemeLight() {
        testTextAreaSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `MISOTextArea` skeleton state in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testTextAreaSkeletonFoxyRoughThemeDark() {
        testTextAreaSkeleton(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
