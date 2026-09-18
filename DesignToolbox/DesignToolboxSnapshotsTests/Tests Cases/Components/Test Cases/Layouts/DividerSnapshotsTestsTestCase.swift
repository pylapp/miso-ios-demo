// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISODivider` for each parameter
open class DividerSnapshotsTestsTestCase: XCTestCase {

    /// This function tests all Divider configuration for the given theme and color schemes on a standard surface.
    ///
    /// It iterates through all colors `MISODividerColor`, for both layout `orientations`.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testAllDividers(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        for orientation: DividerConfigurationModel.Orientation in [.horizontal, .vertical] {
            for dividerColor in MISODividerColor.allCases {
                testDivider(theme: theme, interfaceStyle: interfaceStyle, dividerColor: dividerColor, orientation: orientation)
            }
        }
    }

    /// This function tests divider according to all parameters of the configuration available on a `MISODivider`
    /// for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters
    ///    test_<themeName>_<colorScheme>.<orientation>.<dividerColor>
    ///
    /// - Parameters:
    ///   - theme: The theme (MISOTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - dividerColor: the color of the divider
    ///   - orientation; the oriention of the divider (i.e. MISOHorizontalDivider or MISOVerticalDivider)
    @MainActor func testDivider(theme: MISOTheme,
                                interfaceStyle: UIUserInterfaceStyle,
                                dividerColor: MISODividerColor,
                                orientation: DividerConfigurationModel.Orientation)
    {
        // Generate the illustration for the specified configuration
        let illustration = MISOThemeableView(theme: theme) {
            DividerDemo(configurationModel: DividerConfigurationModel(orientation: orientation, selectedColor: dividerColor))
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        //    test_<themeName>_<colorScheme>.<orientation>.<dividerColor>
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let dividerColorPatern = dividerColor.description
        let orientationPatern = orientation == .horizontal ? "Horizontal" : "Vertical"
        let name = "\(orientationPatern)_\(dividerColorPatern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit
