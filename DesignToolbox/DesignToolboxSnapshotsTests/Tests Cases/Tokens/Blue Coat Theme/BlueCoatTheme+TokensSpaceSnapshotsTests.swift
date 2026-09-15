// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

/// Tests the UI rendering of each **space token** using reference images for `BlueCoatTheme`
final class BlueCoatThemeTokensSpaceSnapshotsTests: TokensSpaceSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// This function tests all _ tokens in the `BlueCoatTheme` with  the `light` color schemes.
    /// It iterates through all `NamedSpace` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. Each snapshot is saved with a name that indicates the spacing type, theme, and color scheme.
    @MainActor func testAllSpacesBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testScaledProperty(theme: theme, interfaceStyle: interfaceStyle)
        testFixedProperty(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingInline(theme: theme, interfaceStyle: interfaceStyle)
        testInset(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingBlock(theme: theme, interfaceStyle: interfaceStyle)
        testColumnGap(theme: theme, interfaceStyle: interfaceStyle)
        testRowGap(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// This function tests all space tokens in the `BlueCoatTheme` with both the  `dark` color schemes.
    /// It iterates through all `NamedSize` cases, rendering each illustration in a `UIHostingController`
    /// and captures a snapshot. The snapshot is saved with a name indicating the space type, theme, and interfaceStyle (i.e color scheme).
    @MainActor func testAllSpacesBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testScaledProperty(theme: theme, interfaceStyle: interfaceStyle)
        testFixedProperty(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingInline(theme: theme, interfaceStyle: interfaceStyle)
        testInset(theme: theme, interfaceStyle: interfaceStyle)
        testPaddingBlock(theme: theme, interfaceStyle: interfaceStyle)
        testColumnGap(theme: theme, interfaceStyle: interfaceStyle)
        testRowGap(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
