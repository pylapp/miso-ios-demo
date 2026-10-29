// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

/// Tests the UI rendering of each **opacity token** using reference images
open class TokensOpacitySnapshotsTestsTestCase: XCTestCase {

    /// Tests all opacity properties by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g., `SoshTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testOpacities(for theme: MISOTheme, in interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all named tokens
        for namedToken in NamedOpacity.allCases {
            // Use the `IllustrationWidth` struct to test a single illustration
            let illustration = MISOThemeableView(theme: theme) {
                IllustrationOpacity(opacityName: namedToken)
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
