// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne

import MISOSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOTag` for each parameter.
///
/// **Warning: the loader state in indterminated variant tag is not tested because of discrepencies with snapshots comparisons**
open class TagSnapshotsTestsTestCase: XCTestCase {

    // MARK: - Tags

    /// Tests all tags with all types, appearances, status and size for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllTags(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        testDisabledTags(theme: theme, interfaceStyle: interfaceStyle)
        testEnabledTags(theme: theme, interfaceStyle: interfaceStyle)
        testLoadingTags(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests tags in disabled state for each layouts, sizes and shapes.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor private func testDisabledTags(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        for layout in TagLayout.allCases {
            for size in MISOTag.Size.allCases {
                for shape in MISOTag.Shape.allCases {

                    let model = TagConfigurationModel()
                    model.statusCategory = .accent
                    model.appearance = .emphasized

                    model.isLoading = false
                    model.enabled = false
                    model.flipIcon = false

                    model.layout = layout
                    model.size = size
                    model.shape = shape

                    let iconTypes: [DefinedStatusIcons] = model.enableFlipIcon ? DefinedStatusIcons.allCases : [.tintedIcon]
                    for iconType in iconTypes {
                        model.iconType = iconType
                        model.flipIcon = false
                        testTag(theme: theme, interfaceStyle: interfaceStyle, model: model)

                        // Add extra test for flip icon if enabled
                        if model.enableFlipIcon {
                            model.flipIcon = true
                            testTag(theme: theme, interfaceStyle: interfaceStyle, model: model)
                        }
                    }
                }
            }
        }
    }

    /// Tests tags in enabled state for each layouts, appearances, catagories, sizes and shapes.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor private func testEnabledTags(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        for layout in TagLayout.allCases {
            for appearance in MISOTag.Appearance.allCases {
                for statusCategory in MISOTag.Status.Category.allCases {
                    for size in MISOTag.Size.allCases {
                        for shape in MISOTag.Shape.allCases {
                            let model = TagConfigurationModel()

                            model.isLoading = false
                            model.enabled = true

                            model.layout = layout
                            model.statusCategory = statusCategory
                            model.appearance = appearance
                            model.size = size
                            model.shape = shape
                            model.flipIcon = false

                            let iconTypes: [DefinedStatusIcons] = model.enableFlipIcon ? DefinedStatusIcons.allCases : [.tintedIcon]
                            for iconType in iconTypes {
                                model.iconType = iconType
                                model.flipIcon = false
                                testTag(theme: theme, interfaceStyle: interfaceStyle, model: model)

                                // Add extra test for flip icon if enabled
                                if model.enableFlipIcon {
                                    model.flipIcon = true
                                    testTag(theme: theme, interfaceStyle: interfaceStyle, model: model)
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    /// Tests tags in loading state for each layouts, catagories, sizes and shapes.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor private func testLoadingTags(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        for layout in TagLayout.allCases {
            for size in MISOTag.Size.allCases {
                for shape in MISOTag.Shape.allCases {
                    let model = TagConfigurationModel()

                    model.enabled = true
                    model.flipIcon = false

                    model.isLoading = true
                    model.layout = layout
                    model.size = size
                    model.shape = shape
                    model.progressVariant = .determinate
                    model.progressValue = 0.75

                    testTag(theme: theme, interfaceStyle: interfaceStyle, model: model)
                }
            }
        }
    }

    /// Tests`MISOTag` according to all parameters of the configuration available for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameter.
    ///
    /// - Parameters:
    ///   - theme: The theme (MISOTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor private func testTag(theme: MISOTheme,
                                    interfaceStyle: UIUserInterfaceStyle,
                                    model: TagConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = MISOThemeableView(theme: theme) {
            TagDemo(configurationModel: model)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        let testName = "testTag_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let layoutPattern = model.layout.debugDescription
        let sizePattern = model.size.technicalDescription
        let shapePattern = model.shape.technicalDescription

        let appearancePattern = model.isLoading ? "" : model.appearance.technicalDescription
        let statusPattern = model.isLoading ? "" : model.statusCategory.technicalDescription
        let loaderPattern = model.isLoading ? ".loading" : ""
        let disabledPatern = model.isLoading ? "" : !model.enabled ? "_Disabled" : "_Enabled"

        let flipIconPattern = model.flipIcon ? ".flipIcon" : ""
        let imageModePattern = model.isLoading ? "" : model.enableFlipIcon
            ? (model.iconType == .image ? "_OriginalImage" : "_TemplateImage")
            : ""

        let name = "\(layoutPattern)\(appearancePattern)\(statusPattern)\(sizePattern)\(shapePattern)\(loaderPattern)\(imageModePattern)\(flipIconPattern)\(disabledPatern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    // MARK: - Input tags

    /// This function tests all input tags with disable state for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllInputTags(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        for enabled in [true, false] {
            let model = InputTagConfigurationModel()
            model.enabled = enabled
            testInputTag(theme: theme, interfaceStyle: interfaceStyle, model: model)
        }
    }

    /// This function tests `MISOInputTag` according to all parameters of the configuration available for the given
    /// theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameter.
    ///
    /// - Parameters:
    ///   - theme: The theme (MISOTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - model: The model contains each element of configuration
    @MainActor private func testInputTag(theme: MISOTheme,
                                         interfaceStyle: UIUserInterfaceStyle,
                                         model: InputTagConfigurationModel)
    {
        // Generate the illustration for the specified configuration
        let illustration = MISOThemeableView(theme: theme) {
            InputTagDemo(configurationModel: model)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        let testName = "testInputTag_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let disabledPattern = model.enabled ? "" : "_Disabled"

        let name = disabledPattern

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

extension TagLayout: CustomDebugStringConvertible {
    var debugDescription: String {
        switch self {
        case .textOnly:
            "textOnly"
        case .textAndBullet:
            "textAndBullet"
        case .textAndIcon:
            "textAndIcon"
        }
    }
}

// swiftlint:enable required_deinit
