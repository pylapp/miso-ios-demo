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

/// Tests the UI rendering of the `MISODisplay`, `MISOHeading`, `MISOBody`, `MISOLabel` and `MISOCode`
/// typography components for each parameter.
open class TypographySnapshotsTestsTestCase: XCTestCase {

    @MainActor func testAllTypography(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        testAllDisplays(theme: theme, interfaceStyle: interfaceStyle)
        testAllHeadings(theme: theme, interfaceStyle: interfaceStyle)
        testAllBodies(theme: theme, interfaceStyle: interfaceStyle)
        testAllLabels(theme: theme, interfaceStyle: interfaceStyle)
        testCode(theme: theme, interfaceStyle: interfaceStyle)
    }

    // MARK: - Display

    @MainActor func testAllDisplays(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        for size in MISODisplay.Size.allCases {
            let model = DisplayConfigurationModel()
            model.text = "Display"
            model.size = size
            testDisplay(theme: theme, interfaceStyle: interfaceStyle, model: model)
        }
    }

    @MainActor private func testDisplay(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle, model: DisplayConfigurationModel) {
        let illustration = MISOThemeableView(theme: theme) {
            MISODisplay(text: model.text, size: model.size)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        let testName = "testTypography_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "Display\(model.size.technicalDescription)"

        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }

    // MARK: - Heading

    @MainActor func testAllHeadings(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        for size in MISOHeading.Size.allCases {
            testHeading(theme: theme, interfaceStyle: interfaceStyle, size: size, hasMarker: false)
        }
        // The marker is only honored for `size == .large` and when the theme supports it.
        testHeading(theme: theme, interfaceStyle: interfaceStyle, size: .large, hasMarker: true)
        // The colored substring is only meaningful for `size == .large`.
        testHeadingColoredSubstring(theme: theme, interfaceStyle: interfaceStyle)
    }

    @MainActor private func testHeading(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle, size: MISOHeading.Size, hasMarker: Bool) {
        let illustration = MISOThemeableView(theme: theme) {
            MISOHeading(text: "Heading", size: size, hasMarker: hasMarker)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        let testName = "testTypography_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let markerPattern = hasMarker ? "_Marker" : ""
        let name = "Heading\(size.technicalDescription)\(markerPattern)"

        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }

    @MainActor private func testHeadingColoredSubstring(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let illustration = MISOThemeableView(theme: theme) {
            MISOHeading(text: "Welcome to Sosh", coloredText: "Sosh")
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        let testName = "testTypography_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "HeadingColoredSubstring"

        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }

    // MARK: - Body

    @MainActor func testAllBodies(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        for size in MISOBody.Size.allCases {
            for weight in MISOBody.Weight.allCases {
                let model = BodyConfigurationModel()
                model.text = "Body"
                model.size = size
                model.weight = weight
                testBody(theme: theme, interfaceStyle: interfaceStyle, model: model)
            }
        }
    }

    @MainActor private func testBody(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle, model: BodyConfigurationModel) {
        let illustration = MISOThemeableView(theme: theme) {
            MISOBody(text: model.text, size: model.size, weight: model.weight)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        let testName = "testTypography_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "Body\(model.size.technicalDescription)\(model.weight.technicalDescription)"

        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }

    // MARK: - Label

    @MainActor func testAllLabels(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        for size in MISOLabel.Size.allCases {
            for weight in MISOLabel.Weight.allCases {
                let model = LabelConfigurationModel()
                model.text = "Label"
                model.size = size
                model.weight = weight
                testLabel(theme: theme, interfaceStyle: interfaceStyle, model: model)
            }
        }
    }

    @MainActor private func testLabel(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle, model: LabelConfigurationModel) {
        let illustration = MISOThemeableView(theme: theme) {
            MISOLabel(text: model.text, size: model.size, weight: model.weight)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        let testName = "testTypography_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "Label\(model.size.technicalDescription)\(model.weight.technicalDescription)"

        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }

    // MARK: - Code

    @MainActor func testCode(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let illustration = MISOThemeableView(theme: theme) {
            MISOCode(text: "let x = 42")
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        let testName = "testTypography_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "Code"

        assertIllustration(illustration, on: interfaceStyle, named: name, testName: testName)
    }
}

// swiftlint:enable required_deinit
