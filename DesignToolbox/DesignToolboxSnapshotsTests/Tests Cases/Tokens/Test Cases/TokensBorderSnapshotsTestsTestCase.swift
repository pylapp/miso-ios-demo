// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

/// Tests the UI rendering of each **border token** using reference images
open class TokensBorderSnapshotsTestsTestCase: XCTestCase {

    /// Tests all border width properties by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g., `BlueCoatTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testBorderWidth(for theme: MISOTheme, in interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all named tokens
        for namedToken in NamedBorderWidth.allCases {
            // Use the `IllustrationWidth` struct to test a single illustration
            let illustration = MISOThemeableView(theme: theme) {
                IllustrationWidth(namedWidth: namedToken)
                    .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current mode (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = namedToken.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               testName: testName)
        }
    }

    /// Tests all border radius properties by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g., `BlueCoatTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testBorderRadius(for theme: MISOTheme, in interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all named tokens
        for namedToken in NamedBorderRadius.allCases {
            // Use the `IllustrationWidth` struct to test a single illustration
            let illustration = MISOThemeableView(theme: theme) {
                IllustrationRadius(namedRadius: namedToken)
                    .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current mode (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = namedToken.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               testName: testName)
        }
    }

    /// Tests all border style properties by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g., `BlueCoatTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testBorderStyle(for theme: MISOTheme, in interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all named tokens
        for namedToken in NamedBorderStyle.allCases {
            // Use the `IllustrationWidth` struct to test a single illustration
            let illustration = MISOThemeableView(theme: theme) {
                IllustrationStyle(namedStyle: namedToken)
                    .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
            }

            // Create a unique snapshot name based on the current mode (light or dark) and the color's raw value
            let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
            let name = namedToken.rawValue

            // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
            assertIllustration(illustration,
                               on: interfaceStyle,
                               named: name,
                               testName: testName)
        }
    }
}

// swiftlint:enable required_deinit
