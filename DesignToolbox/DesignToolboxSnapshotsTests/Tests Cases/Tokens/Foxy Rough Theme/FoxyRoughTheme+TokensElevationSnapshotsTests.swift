// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit
// swiftlint:disable type_name

/// Tests the UI rendering of each **elevation token** using reference images for `FoxyRoughTheme`
final class FoxyRoughThemeTokensElevationSnapshotsTests: TokensElevationSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = FoxyRoughTheme()
    }

    /// This function tests all elevation tokens in the `FoxyRoughTheme` with the `light` color scheme.
    /// It iterates through all `NamedElevation` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. The snapshot is saved with a name indicating the elevation, theme, and color scheme.
    @MainActor func testAllElevationsFoxyRoughThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testElevations(for: theme, in: interfaceStyle)
    }

    /// This function tests all elevation tokens in the `FoxyRoughTheme` with the `dark` color scheme.
    /// It iterates through all `NamedElevation` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. The snapshot is saved with a name indicating the elevation, theme, and color scheme.
    @MainActor func testAllElevationsFoxyRoughThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testElevations(for: theme, in: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
// swiftlint:enable type_name
