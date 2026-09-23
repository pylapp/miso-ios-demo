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

/// Tests the UI rendering of the `MISOCheckboxIndeterminate` and `MISOCheckboxItemIndeterminate` for each parameter.
/// `MISOCheckbox` and `MISOCheckboxItem` won't be tested as, until today, are based on the same layouts and look and feels, and the only difference
/// is in the management of the states.
open class CheckboxSnapshotsTestsTestCase: XCTestCase {

    // swiftlint:disable function_body_length
    /// This function tests all checkboxes configuration for the given theme and color scheme on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// It iterates through all `MISOCheckboxIndicatorState`, for all combinations of layouts in enabled and disabled state.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllCheckboxes(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        for indicatorState in MISOCheckboxIndicatorState.allCases {
            for someLayout in availableLayouts(isError: false, isReadOnly: false) {
                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .normal,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)

                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .normal,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: true)

                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .high,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)

                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .high,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: true)
            }
        }

        for indicatorState in MISOCheckboxIndicatorState.allCases {
            for someLayout in availableLayouts(isError: true, isReadOnly: false) {
                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .normal,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)

                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .high,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)
            }

            for someLayout in availableLayouts(isError: true, errorText: "Error text", isReadOnly: false) {
                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .normal,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)

                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .high,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)
            }
        }

        for indicatorState in MISOCheckboxIndicatorState.allCases {
            for someLayout in availableLayouts(isError: false, isReadOnly: true) {
                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .normal,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)

                testCheckbox(theme: theme,
                             interfaceStyle: interfaceStyle,
                             a11yContrast: .high,
                             layout: someLayout,
                             indicatorState: indicatorState,
                             isDisabled: false)
            }
        }
    }

    // swiftlint:enable function_body_length

    /// This function tests checkbox according to all parameters of the configuration available on a `MISOCheckbox`
    /// of `MISOCheckboxItem` for the given theme and color schemes.
    ///
    /// It captures a snapshot for each tests. The snapshots are saved with names based on each parameters.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// - Parameters:
    ///   - theme: The theme (MISOTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - a11yContrast: The constrat to apply (high or not)
    ///   - layout: the layout of the checkbox
    ///   - indicatorState: the indicator state of the checkbox
    ///   - isDisabled: the disabled flag
    @MainActor func testCheckbox(theme: MISOTheme,
                                 interfaceStyle: UIUserInterfaceStyle,
                                 a11yContrast: UIAccessibilityContrast,
                                 layout: CheckboxIndeterminateTest.Layout,
                                 indicatorState: MISOCheckboxIndicatorState,
                                 isDisabled: Bool)
    {
        // Generate the illustration for the specified configuration
        let illustration = MISOThemeableView(theme: theme) {
            CheckboxIndeterminateTest(layout: layout,
                                      indicatorState: indicatorState,
                                      isDisabled: isDisabled)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test_<themeName>_<colorScheme>.<layout>_<indicatorState>_<disabledPatern> where:
        // - `disabledPatern` is empty if not disabled
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let disabledPatern = isDisabled ? "_Disabled" : ""
        let name = "\(layout.description.camelCase)_\(indicatorState.name)_\(disabledPatern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           a11yContrast: a11yContrast,
                           named: name,
                           precision: 0.92,
                           testName: testName)
    }

    // swiftlint:disable line_length
    // swiftlint:disable function_default_parameter_at_end
    @MainActor private func availableLayouts(isError: Bool, errorText: String? = nil, isReadOnly: Bool) -> [CheckboxIndeterminateTest.Layout] {
        [
            CheckboxIndeterminateTest.Layout.indicatorOnly(isError: isError, isReadOnly: isReadOnly),

            CheckboxIndeterminateTest.Layout.default(labelText: "Takoyaki", descriptionText: nil, image: nil, isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Takoyaki", descriptionText: nil, image: nil, isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Patatas", descriptionText: "Bravas", image: nil, isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Patatas", descriptionText: "Bravas", image: nil, isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),

            CheckboxIndeterminateTest.Layout.default(labelText: "Kammthaar", descriptionText: nil, image: MISOImage(asset: Image.defaultImage()), isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Kammthaar", descriptionText: nil, image: MISOImage(asset: Image.defaultImage()), isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Patatas", descriptionText: "Bravas", image: MISOImage(asset: Image.defaultImage()), isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Patatas", descriptionText: "Bravas", image: MISOImage(asset: Image.defaultImage()), isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),

            CheckboxIndeterminateTest.Layout.default(labelText: "Kammthaar", descriptionText: nil, image: MISOImage(asset: Image.defaultImage(), flipped: true), isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Kammthaar", descriptionText: nil, image: MISOImage(asset: Image.defaultImage(), flipped: true), isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Patatas", descriptionText: "Bravas", image: MISOImage(asset: Image.defaultImage(), flipped: true), isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.default(labelText: "Patatas", descriptionText: "Bravas", image: MISOImage(asset: Image.defaultImage(), flipped: true), isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),

            CheckboxIndeterminateTest.Layout.reversed(labelText: "Takoyaki", descriptionText: nil, image: nil, isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Takoyaki", descriptionText: nil, image: nil, isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Patatas", descriptionText: "Bravas", image: nil, isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Patatas", descriptionText: "Bravas", image: nil, isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),

            CheckboxIndeterminateTest.Layout.reversed(labelText: "Kammthaar", descriptionText: nil, image: MISOImage(asset: Image.defaultImage()), isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Kammthaar", descriptionText: nil, image: MISOImage(asset: Image.defaultImage()), isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Patatas", descriptionText: "Bravas", image: MISOImage(asset: Image.defaultImage()), isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Patatas", descriptionText: "Bravas", image: MISOImage(asset: Image.defaultImage()), isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),

            CheckboxIndeterminateTest.Layout.reversed(labelText: "Kammthaar", descriptionText: nil, image: MISOImage(asset: Image.defaultImage(), flipped: true), isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Kammthaar", descriptionText: nil, image: MISOImage(asset: Image.defaultImage(), flipped: true), isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Patatas", descriptionText: "Bravas", image: MISOImage(asset: Image.defaultImage(), flipped: true), isError: isError, errorText: errorText, hasDivider: false, isReadOnly: isReadOnly),
            CheckboxIndeterminateTest.Layout.reversed(labelText: "Patatas", descriptionText: "Bravas", image: MISOImage(asset: Image.defaultImage(), flipped: true), isError: isError, errorText: errorText, hasDivider: true, isReadOnly: isReadOnly),
        ]
    }
    // swiftlint:enable line_length
    // swiftlint:enable function_default_parameter_at_end
}

// swiftlint:enable required_deinit

// MARK: - Checkbox Test

/// The test object which will define the `MISOCheckboxIndeterminate` or `MISOCheckboxItemIndeterminate`object to test.
struct CheckboxIndeterminateTest: View {

    enum Layout { // Checkbox.Layout is private, not accessiblefrom  here
        case indicatorOnly(isError: Bool, isReadOnly: Bool)
        case `default`(labelText: String,
                       descriptionText: String?,
                       image: MISOImage?,
                       isError: Bool,
                       errorText: String? = nil,
                       hasDivider: Bool,
                       isReadOnly: Bool)
        case reversed(labelText: String,
                      descriptionText: String?,
                      image: MISOImage?,
                      isError: Bool,
                      errorText: String? = nil,
                      hasDivider: Bool,
                      isReadOnly: Bool)

        // swiftlint:disable line_length
        @MainActor var description: String {
            switch self {
            case let .indicatorOnly(isError, isReadOnly):
                "layout-indicatorOnly-\(isError ? "error" : "")-\(isReadOnly ? "readOnly" : "")"
            case let .default(_, descriptionText, image, isError, errorText, hasDivider, isReadOnly):
                "layout-default-label-\(descriptionText != nil ? "withDescription" : "")-\(image != nil ? "withIcon" : "")-\(image?.flipped == true ? "flipIcon" : "")-\(isError ? "error-\(errorText != nil ? "withError" : "")" : "")-\(isReadOnly ? "readOnly" : "")-\(hasDivider ? "divider" : "")"
            case let .reversed(_, descriptionText, image, isError, errorText, hasDivider, isReadOnly):
                "layout-inverse-label-\(descriptionText != nil ? "descriptionText" : "")-\(image != nil ? "withIcon" : "")-\(image?.flipped == true ? "flipIcon" : "")-\(isError ? "error-\(errorText != nil ? "witError" : "")" : "")-\(isReadOnly ? "readOnly" : "")-\(hasDivider ? "divider" : "")"
            }
        }
        // swiftlint:enable line_length
    }

    let layout: Layout
    let indicatorState: MISOCheckboxIndicatorState
    let isDisabled: Bool

    var body: some View {
        checkbox()
    }

    @ViewBuilder
    func checkbox() -> some View {
        switch layout {
        case let .indicatorOnly(isError, isReadOnly):
            MISOCheckboxIndeterminate(selection: .constant(indicatorState),
                                      accessibilityLabel: "Bazinga!",
                                      isError: isError,
                                      isReadOnly: isReadOnly)
                .disabled(isDisabled)
        case let .default(labelText, descriptionText, image, isError, errorText, hasDivider, isReadOnly):
            MISOCheckboxItemIndeterminate(labelText,
                                          selection: .constant(indicatorState),
                                          description: descriptionText,
                                          image: image,
                                          isReversed: false,
                                          isError: isError,
                                          errorText: errorText,
                                          isReadOnly: isReadOnly,
                                          hasDivider: hasDivider)
                .disabled(isDisabled)
        case let .reversed(labelText, descriptionText, image, isError, errorText, hasDivider, isReadOnly):
            MISOCheckboxItemIndeterminate(labelText,
                                          selection: .constant(indicatorState),
                                          description: descriptionText,
                                          image: image,
                                          isReversed: true,
                                          isError: isError,
                                          errorText: errorText,
                                          isReadOnly: isReadOnly,
                                          hasDivider: hasDivider)
                .disabled(isDisabled)
        }
    }
}

// MARK: - extension MISOCheckboxIndicatorState

extension MISOCheckboxIndicatorState {
    var name: String {
        switch self {
        case .selected:
            "Selected"
        case .unselected:
            "Unselected"
        case .indeterminate:
            "Indeterminate"
        }
    }
}
