// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

/// Tests the UI rendering of each **border token** using reference images for `FoxyRoughTheme`
final class FoxyRoughThemeTokensBorderSnapshotsTests: TokensBorderSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// This function tests all border tokens in the `FoxyRoughTheme` with the `light` color schemes.
    /// It iterates through all `NamedBorderWidth`, `NamedBorderRafius`, and`NamedBorderStyle` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. Each snapshot is saved with a name that indicates the spacing type, theme, and color scheme.
    @MainActor func testAllBorderFoxyRoughThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testBorderWidth(for: theme, in: interfaceStyle)
        testBorderRadius(for: theme, in: interfaceStyle)
        testBorderStyle(for: theme, in: interfaceStyle)
    }

    /// This function tests all border tokens in the `FoxyRoughTheme` with  the `dark` color schemes.
    /// It iterates through all `NamedSize` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. Each snapshot is saved with a name that indicates the spacing type, theme, and color scheme.
    @MainActor func testAllBorderFoxyRoughThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testBorderWidth(for: theme, in: interfaceStyle)
        testBorderRadius(for: theme, in: interfaceStyle)
        testBorderStyle(for: theme, in: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
