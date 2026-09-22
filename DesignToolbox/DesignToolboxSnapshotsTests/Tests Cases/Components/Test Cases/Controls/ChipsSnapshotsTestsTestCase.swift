// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

/// Tests the UI rendering of the `MISOFilterChip` and `MISOSuggestionChip` for each parameter.
open class ChipsSnapshotsTestsTestCase: XCTestCase {

    /// This function tests all chips (Filter and Suggestion) with all layouts, for the given theme and color scheme.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// It iterates through all `ChipLayout.Layout`, for all combinations of layouts in enabled and disabled state.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllChips(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {

        // Test MISOSuggestionChips
        for layout in ChipLayout.allCases {
            for enabled in [true, false] {
                let imageModes: [DefinedStatusIcons] = layout == .textOnly ? [.tintedIcon] : DefinedStatusIcons.allCases
                for iconType in imageModes {
                    let model = SuggestionChipConfigurationModel()
                    model.layout = layout
                    model.enabled = enabled
                    model.iconType = iconType

                    testSuggestionChips(theme: theme, interfaceStyle: interfaceStyle, model: model, isLongText: false)

                    model.text = "¡ Bravas patatas ! ¡ Patatas bravas ! ¡ Patatata-patatata-patatas bravas !"
                    testSuggestionChips(theme: theme, interfaceStyle: interfaceStyle, model: model, isLongText: true)
                }
            }
        }

        // Test MISOFilterChips
        for layout in ChipLayout.allCases {
            for selected in [true, false] {
                for enabled in [true, false] {
                    let imageModes: [DefinedStatusIcons] = layout == .textOnly ? [.tintedIcon] : DefinedStatusIcons.allCases
                    for iconType in imageModes {
                        let model = FilterChipConfigurationModel()
                        model.layout = layout
                        model.selected = selected
                        model.enabled = enabled
                        model.iconType = iconType

                        testFilterChips(theme: theme, interfaceStyle: interfaceStyle, model: model, isLongText: false)

                        model.text = "¡ Bravas patatas ! ¡ Patatas bravas ! ¡ Patatata-patatata-patatas bravas !"
                        testFilterChips(theme: theme, interfaceStyle: interfaceStyle, model: model, isLongText: true)
                    }
                }
            }
        }
    }

    /// This function tests `MISOFilterChip` according to all parameters of the configuration available
    /// (Layout, enable state and selection) for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters.
    ///
    /// **/!\ It does not text the hover and pressed states.**
    ///
    /// - Parameters:
    ///   - theme: The theme (MISOTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    ///   - isLongText: Flag to rise to record in the snapshot file name the text of the chip is considered long
    @MainActor func testFilterChips(theme: MISOTheme,
                                    interfaceStyle: UIUserInterfaceStyle,
                                    model: FilterChipConfigurationModel,
                                    isLongText: Bool)
    {
        // Generate the illustration for the specified configuration
        let illustration = MISOThemeableView(theme: theme) {
            FilterChipDemo(configurationModel: model)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test_<themeName>_<colorScheme>.<layout>_<selectionPattern>_<disabledPattern> where:
        // - `disabledPattern` is empty if not disabled
        // - `selectionPattern` is empty if not selected
        let testName = "testFilter_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let disabledPattern = !model.enabled ? "_Disabled" : ""
        let selectedPattern = model.selected ? "_Selected" : ""
        let imageModePattern = model.layout != .textOnly ? (model.iconType == .image ? "_OriginalImage" : "_TemplateImage") : ""
        let textLengthPattern = isLongText ? "_LongText" : "_ShortText"
        let name = "\(model.layout.debugDescription)\(imageModePattern)\(textLengthPattern)\(selectedPattern)\(disabledPattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    /// This function tests `MISOSuggestionChip` according to all parameters of the configuration available
    /// (Layout, enable state) for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters.
    ///
    /// **/!\ It does not text the hover and pressed states.**
    ///
    /// - Parameters:
    ///   - theme: The theme (MISOTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    ///   - isLongText: Flag to rise to record in the snapshot file name the text of the chip is considered long
    @MainActor func testSuggestionChips(theme: MISOTheme,
                                        interfaceStyle: UIUserInterfaceStyle,
                                        model: SuggestionChipConfigurationModel,
                                        isLongText: Bool)
    {
        // Generate the illustration for the specified configuration
        let illustration = MISOThemeableView(theme: theme) {
            SuggestionChipDemo(configurationModel: model)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test_<themeName>_<colorScheme>.<layout><disabledPattern> where:
        // - `disabledPattern` is empty if not disabled
        let testName = "testSuggestion_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let disabledPattern = !model.enabled ? "_Disabled" : ""
        let imageModePattern = model.layout != .textOnly ? (model.iconType == .image ? "_OriginalImage" : "_TemplateImage") : ""
        let textLengthPattern = isLongText ? "_LongText" : "_ShortText"
        let name = "\(model.layout.debugDescription)\(imageModePattern)\(textLengthPattern)\(disabledPattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

extension ChipLayout: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .textOnly:
            "TextOnly"
        case .textAndIcon:
            "TextAndIcon"
        case .iconOnly:
            "IconOnly"
        }
    }
}

// swiftlint:enable required_deinit
