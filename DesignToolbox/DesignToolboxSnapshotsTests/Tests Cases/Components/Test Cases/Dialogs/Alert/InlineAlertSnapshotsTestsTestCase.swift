// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne

import MISOSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `OUDSInlineAlert` for each parameter
open class InlineAlertSnapshotsTestsTestCase: XCTestCase {

    /// This function tests some InlineAlert configuration for the given theme and color schemes on a standard surface.
    /// It iterates through all `AlertStatus` values.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testAllInlineAlerts(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {

        for status in AlertStatus.allCases {
            for statusIcon in StatusIcons.allCases {
                let model = InlineAlertConfigurationModel()
                model.status = status
                model.statusIcon = statusIcon

                testInlineAlert(theme: theme,
                                interfaceStyle: interfaceStyle,
                                model: model)
            }
        }
    }

    /// This function tests InlineAlert according to parameters of the configuration available on a `OUDSInlineAlert`
    /// for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters
    ///    test_<themeName>_<colorScheme>_<status>
    ///
    /// - Parameters:
    ///   - theme: The theme (MISOTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor private func testInlineAlert(theme: MISOTheme,
                                            interfaceStyle: UIUserInterfaceStyle,
                                            model: InlineAlertConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = MISOThemeableView(theme: theme) {
            InlineAlertDemo(configurationModel: model)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        //    test_<themeName>_<colorScheme>_<type>_<textStyle>_<isBold>
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let statusPattern = model.status.technicalDescription
        let statusIconPattern = model.statusIcon.technicalDescription

        let name = "\(statusPattern)\(statusIconPattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit
