// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

/// Tests the UI rendering of each **space token** using reference images
open class TokensSpaceSnapshotsTestsTestCase: XCTestCase {

    /// Tests all scaled `Scaled` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g. `BlueCoatTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testScaledProperty(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all background color cases defined in NamedSpace.Scaled
        for namedToken in NamedSpace.Scaled.allCases {
            // Generate the illustration for the specified space token
            let illustration = MISOThemeableView(theme: theme) {
                ScaledSpaceProperty.Illustration(for: namedToken)
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

    /// Tests all padding fixed `Fixed` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g., `BlueCoatTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testFixedProperty(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Iterate through all background color cases defined in NamedSpace.PaddingInline
        for namedToken in NamedSpace.Fixed.allCases {

            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = MISOThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    FixedSpaceProperty.Illustration(token: token)
                }
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

    /// Tests all padding inset `Inset` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g. `BlueCoatTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testInset(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all background color cases defined in NamedSpace.Inset
        for namedToken in NamedSpace.Inset.allCases {
            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = MISOThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    InsetSpaceProperty.Illustration(token: token)
                }
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

    /// Tests all padding inline `PaddingInline` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g. `BlueCoatTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testPaddingInline(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Iterate through all background color cases defined in NamedSpace.PaddingInline
        for namedToken in NamedSpace.PaddingInline.allCases {
            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = MISOThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    PaddingInlineProperty.Illustration(token: token)
                }
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

    /// Tests all padding block `PaddingBlock` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g. `BlueCoatTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testPaddingBlock(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all background color cases defined in NamedSpace.PaddingBlock
        for namedToken in NamedSpace.PaddingBlock.allCases {
            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = MISOThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    PaddingBlockProperty.Illustration(token: token)
                }
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

    /// Tests all Column Gap `ColumnGap` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g. `BlueCoatTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testColumnGap(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all background color cases defined in NamedSpace.ColumnGap
        for namedToken in NamedSpace.ColumnGap.allCases {
            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = MISOThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    ColumnGapProperty.Illustration(token: token)
                }
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

    /// Tests all `RowGap` spaces by capturing their snapshots.
    /// - Parameters:
    ///   - theme: Theme used for rendering tokens (e.g. `BlueCoatTheme`).
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testRowGap(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Iterate through all background color cases defined in NamedSpace.ColumnGap
        for namedToken in NamedSpace.RowGap.allCases {
            // Generate the illustration for the specified space token using the spacePage instance
            let illustration = MISOThemeableView(theme: theme) {
                SpaceTokenVariant(namedSpaceToken: namedToken) { token in
                    RowGapProperty.Illustration(token: token)
                }
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
