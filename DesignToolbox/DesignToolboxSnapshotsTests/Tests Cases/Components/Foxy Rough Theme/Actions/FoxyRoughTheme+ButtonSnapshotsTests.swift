// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

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

    // MARK: Skeleton

    /// Tests the `MISOButton` skeleton state in the `FoxyRoughTheme` with the `light` color scheme.
    @MainActor func testButtonSkeletonFoxyRoughThemeLight() {
        testButtonSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `MISOButton` skeleton state in the `FoxyRoughTheme` with the `dark` color scheme.
    @MainActor func testButtonSkeletonFoxyRoughThemeDark() {
        testButtonSkeleton(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
