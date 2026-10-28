// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOLink` for each parameter  for `BlueCoatTheme`.
final class BlueCoatThemeLinkSnapshotsTests: LinkSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// Tests all link configuration in the `BlueCoatTheme` with the `light` color schemes.
    @MainActor func testAllLinksBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllLinks(theme: theme, interfaceStyle: interfaceStyle)
        testAllLinksOnColoredSurface(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all link configuration in the `BlueCoatTheme` with the `dark` color schemes.
    @MainActor func testAllLinksBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllLinks(theme: theme, interfaceStyle: interfaceStyle)
        testAllLinksOnColoredSurface(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests the `MISOLink` skeleton state in the `BlueCoatTheme` with the `light` color scheme.
    @MainActor func testLinkSkeletonBlueCoatThemeLight() {
        testLinkSkeleton(theme: theme, interfaceStyle: .light)
    }

    /// Tests the `MISOLink` skeleton state in the `BlueCoatTheme` with the `dark` color scheme.
    @MainActor func testLinkSkeletonBlueCoatThemeDark() {
        testLinkSkeleton(theme: theme, interfaceStyle: .dark)
    }
}

// swiftlint:enable required_deinit
