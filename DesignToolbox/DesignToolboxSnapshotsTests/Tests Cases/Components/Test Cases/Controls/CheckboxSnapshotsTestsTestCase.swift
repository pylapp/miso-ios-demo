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
///
/// To limit the amount of reference images, combinatorial axes are gathered into a single ``SnapshotGrid``
/// per remaining-axis combination (one assertion = one reference image).
///
/// Axes kept as separate files (= filename):
///   - `layoutScope` ∈ {IndicatorOnly, Item} (IndicatorOnly covers `MISOCheckboxIndeterminate`; Item covers
///     `MISOCheckboxItemIndeterminate` with both Default and Reversed families folded into the same grid).
///   - `mode` ∈ {Normal, Error, ErrorWithText, ReadOnly} (ErrorWithText skipped for IndicatorOnly).
///   - `contentVariant` for Item (6 variants covering label / description / image / flipped image combinations).
///   - `a11yContrast` ∈ {Normal, HighContrast} (forced to filename because the UITraitCollection is applied
///     to the whole illustration by `assertIllustration`).
///
/// Axes folded into each grid:
///   - Item grids: `family (Default|Reversed) × hasDivider × indicatorState × isDisabled`.
///   - IndicatorOnly grids: `indicatorState × isDisabled`.
///
/// Grid layout for Item files:
///   - 4 columns: `family × hasDivider` ∈ {Default/NoDivider, Default/Divider, Reversed/NoDivider, Reversed/Divider}.
///   - Rows: one per `indicatorState × isDisabled` (6 rows in Normal mode, 3 rows in Error/ErrorWithText/ReadOnly
///     where only `isDisabled = false` is exercised historically).
///
/// **/!\ It does not test the hover and pressed states.**
open class CheckboxSnapshotsTestsTestCase: XCTestCase {

    /// Fixed size applied to each cell of a checkbox grid. Width accommodates label + description + image
    /// + (optional) divider; height accommodates label + description + optional error text + 2 caption lines.
    private static let cellSize = CGSize(width: 320, height: 90)

    // MARK: - Entry Point

    /// Tests all checkbox configurations for the given theme and color scheme on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllCheckboxes(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        for a11yContrast in [UIAccessibilityContrast.normal, .high] {
            // IndicatorOnly: modes {Normal, Error, ReadOnly}.
            for mode in CheckboxMode.indicatorOnlyModes {
                testIndicatorOnlyGrid(theme: theme,
                                      interfaceStyle: interfaceStyle,
                                      a11yContrast: a11yContrast,
                                      mode: mode)
            }

            // Item (Default + Reversed combined): modes × 6 contentVariants.
            for mode in CheckboxMode.itemModes {
                for contentVariant in CheckboxContentVariant.allCases {
                    testItemGrid(theme: theme,
                                 interfaceStyle: interfaceStyle,
                                 a11yContrast: a11yContrast,
                                 mode: mode,
                                 contentVariant: contentVariant)
                }
            }
        }
    }

    // MARK: - IndicatorOnly Grid

    @MainActor private func testIndicatorOnlyGrid(theme: MISOTheme,
                                                  interfaceStyle: UIUserInterfaceStyle,
                                                  a11yContrast: UIAccessibilityContrast,
                                                  mode: CheckboxMode)
    {
        let disabledValues = mode.testsDisabled ? [false, true] : [false]
        var cells: [SnapshotGridCell<AnyView>] = []
        for state in MISOCheckboxIndicatorState.allCases {
            for isDisabled in disabledValues {
                let layout = CheckboxIndeterminateTest.Layout.indicatorOnly(isError: mode.isError,
                                                                            isReadOnly: mode.isReadOnly)
                cells.append(cell(theme: theme,
                                  layout: layout,
                                  indicatorState: state,
                                  isDisabled: isDisabled,
                                  caption: stateCaption(state: state, isDisabled: isDisabled)))
            }
        }

        let columns = disabledValues.count
        let name = "IndicatorOnly_\(mode.filenameToken)_\(contrastToken(a11yContrast))"
        assertGrid(theme: theme,
                   interfaceStyle: interfaceStyle,
                   a11yContrast: a11yContrast,
                   snapshotName: name,
                   columns: columns,
                   cells: cells)
    }

    // MARK: - Item Grid (Default + Reversed combined)

    @MainActor private func testItemGrid(theme: MISOTheme,
                                         interfaceStyle: UIUserInterfaceStyle,
                                         a11yContrast: UIAccessibilityContrast,
                                         mode: CheckboxMode,
                                         contentVariant: CheckboxContentVariant)
    {
        let disabledValues = mode.testsDisabled ? [false, true] : [false]

        // One column per (family × hasDivider), one row per (indicatorState × isDisabled).
        let columnAxes: [(family: CheckboxLayoutFamily, hasDivider: Bool)] = [
            (.default, false), (.default, true), (.reversed, false), (.reversed, true),
        ]

        var cells: [SnapshotGridCell<AnyView>] = []
        for state in MISOCheckboxIndicatorState.allCases {
            for isDisabled in disabledValues {
                for axis in columnAxes {
                    let variant = CheckboxItemVariant(family: axis.family,
                                                      mode: mode,
                                                      contentVariant: contentVariant,
                                                      hasDivider: axis.hasDivider)
                    let layout = makeItemLayout(variant: variant)
                    cells.append(cell(theme: theme,
                                      layout: layout,
                                      indicatorState: state,
                                      isDisabled: isDisabled,
                                      caption: itemCaption(family: axis.family,
                                                           hasDivider: axis.hasDivider,
                                                           state: state,
                                                           isDisabled: isDisabled)))
                }
            }
        }

        let name = "\(contentVariant.filenameToken)_\(mode.filenameToken)_\(contrastToken(a11yContrast))"
        assertGrid(theme: theme,
                   interfaceStyle: interfaceStyle,
                   a11yContrast: a11yContrast,
                   snapshotName: name,
                   columns: columnAxes.count,
                   cells: cells)
    }

    // MARK: - Layout Builders

    @MainActor private func makeItemLayout(variant: CheckboxItemVariant) -> CheckboxIndeterminateTest.Layout {
        let labelText = variant.contentVariant.labelText
        let descriptionText = variant.contentVariant.descriptionText
        let image = variant.contentVariant.image
        let isError = variant.mode.isError
        let errorText = variant.mode.errorText
        let isReadOnly = variant.mode.isReadOnly
        let hasDivider = variant.hasDivider

        switch variant.family {
        case .default:
            return .default(labelText: labelText,
                            descriptionText: descriptionText,
                            image: image,
                            isError: isError,
                            errorText: errorText,
                            hasDivider: hasDivider,
                            isReadOnly: isReadOnly)
        case .reversed:
            return .reversed(labelText: labelText,
                             descriptionText: descriptionText,
                             image: image,
                             isError: isError,
                             errorText: errorText,
                             hasDivider: hasDivider,
                             isReadOnly: isReadOnly)
        }
    }

    // MARK: - Cell Builder

    @MainActor private func cell(theme: MISOTheme,
                                 layout: CheckboxIndeterminateTest.Layout,
                                 indicatorState: MISOCheckboxIndicatorState,
                                 isDisabled: Bool,
                                 caption: String) -> SnapshotGridCell<AnyView>
    {
        SnapshotGridCell(caption: caption) {
            AnyView(
                MISOThemeableView(theme: theme) {
                    CheckboxIndeterminateTest(layout: layout,
                                              indicatorState: indicatorState,
                                              isDisabled: isDisabled)
                })
        }
    }

    // MARK: - Captions

    private func stateCaption(state: MISOCheckboxIndicatorState, isDisabled: Bool) -> String {
        "\(state.name)\n\(isDisabled ? "disabled" : "enabled")"
    }

    private func itemCaption(family: CheckboxLayoutFamily,
                             hasDivider: Bool,
                             state: MISOCheckboxIndicatorState,
                             isDisabled: Bool) -> String
    {
        let familyShort = family == .default ? "Def" : "Rev"
        let dividerShort = hasDivider ? "+div" : "-div"
        return "\(familyShort) \(dividerShort)\n\(state.name) · \(isDisabled ? "dis" : "ena")"
    }

    private func contrastToken(_ contrast: UIAccessibilityContrast) -> String {
        contrast == .high ? "HighContrast" : "NormalContrast"
    }

    // MARK: - Grid Assertion

    /// Composes the grid and captures a single snapshot assertion.
    @MainActor private func assertGrid(theme: MISOTheme,
                                       interfaceStyle: UIUserInterfaceStyle,
                                       a11yContrast: UIAccessibilityContrast,
                                       snapshotName: String,
                                       columns: Int,
                                       cells: [SnapshotGridCell<AnyView>])
    {
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"

        let grid = SnapshotGrid(
            columns: columns,
            cellSize: Self.cellSize,
            cells: cells,
            title: "\(testName).\(snapshotName)")

        let illustration = MISOThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        assertIllustration(illustration,
                           on: interfaceStyle,
                           a11yContrast: a11yContrast,
                           named: snapshotName,
                           precision: 0.92, // Historical tolerance kept from the legacy test case.
                           testName: testName)
    }

    /// This function tests the `MISOCheckboxIndeterminate` skeleton state (default configuration) for the given theme and color scheme.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`).
    ///   - interfaceStyle: The user interface style (light or dark).
    @MainActor func testCheckboxSkeleton(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        // Generate the illustration for the specified configuration
        let illustration = MISOThemeableView(theme: theme) {
            MISOCheckboxIndeterminate(selection: .constant(.unselected),
                                      accessibilityLabel: "Bazinga!",
                                      isError: false,
                                      isReadOnly: false)
                .showSkeleton(isVisible: true, isAnimated: false)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration
        let testName = "testCheckbox_skeleton_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "CheckboxSkeleton"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit

// MARK: - Promoted Axes

/// Groups the axes that identify a single Default/Reversed item cell, to keep call-site signatures small.
struct CheckboxItemVariant {
    let family: CheckboxLayoutFamily
    let mode: CheckboxMode
    let contentVariant: CheckboxContentVariant
    let hasDivider: Bool
}

/// The checkbox layout family. Folded into the grid (one column per family × hasDivider).
enum CheckboxLayoutFamily {
    case `default`
    case reversed
}

/// The checkbox functional mode. Promoted to the snapshot filename.
///
/// Combines the legacy `isError / errorText / isReadOnly` flags into a single enum. Only valid combinations
/// from the original test case are represented.
enum CheckboxMode: CaseIterable {
    case normal
    case error
    case errorWithText
    case readOnly

    static let indicatorOnlyModes: [CheckboxMode] = [.normal, .error, .readOnly]
    static let itemModes: [CheckboxMode] = [.normal, .error, .errorWithText, .readOnly]

    var filenameToken: String {
        switch self {
        case .normal:
            "Normal"
        case .error:
            "Error"
        case .errorWithText:
            "ErrorWithText"
        case .readOnly:
            "ReadOnly"
        }
    }

    var isError: Bool {
        self == .error || self == .errorWithText
    }

    var isReadOnly: Bool {
        self == .readOnly
    }

    var errorText: String? {
        self == .errorWithText ? "Error text" : nil
    }

    /// Only the `normal` mode exercises the disabled flag in the legacy tests. Keep that behavior.
    var testsDisabled: Bool {
        self == .normal
    }
}

/// The content variant used by `.default` / `.reversed` layouts. Promoted to the snapshot filename.
///
/// Covers all six combinations of (label-only vs label+description) × (no image, image, flipped image)
/// exercised in the legacy test case so visual coverage is preserved.
enum CheckboxContentVariant: CaseIterable {
    case labelOnly
    case labelDescription
    case labelImage
    case labelDescriptionImage
    case labelImageFlipped
    case labelDescriptionImageFlipped

    var filenameToken: String {
        switch self {
        case .labelOnly:
            "LabelOnly"
        case .labelDescription:
            "LabelDescription"
        case .labelImage:
            "LabelImage"
        case .labelDescriptionImage:
            "LabelDescImage"
        case .labelImageFlipped:
            "LabelImageFlipped"
        case .labelDescriptionImageFlipped:
            "LabelDescImageFlipped"
        }
    }

    var labelText: String {
        hasDescription ? "Patatas" : (hasImage ? "Kammthaar" : "Takoyaki")
    }

    var descriptionText: String? {
        hasDescription ? "Bravas" : nil
    }

    @MainActor var image: MISOImage? {
        switch self {
        case .labelOnly, .labelDescription:
            nil
        case .labelImage, .labelDescriptionImage:
            MISOImage(asset: Image.defaultImage())
        case .labelImageFlipped, .labelDescriptionImageFlipped:
            MISOImage(asset: Image.defaultImage(), flipped: true)
        }
    }

    private var hasDescription: Bool {
        switch self {
        case .labelDescription, .labelDescriptionImage, .labelDescriptionImageFlipped:
            true
        default:
            false
        }
    }

    private var hasImage: Bool {
        switch self {
        case .labelImage, .labelDescriptionImage, .labelImageFlipped, .labelDescriptionImageFlipped:
            true
        default:
            false
        }
    }
}

// MARK: - Checkbox Test

/// The test object which will define the `MISOCheckboxIndeterminate` or `MISOCheckboxItemIndeterminate` object to test.
struct CheckboxIndeterminateTest: View {

    enum Layout { // Checkbox.Layout is private, not accessible from here
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
                                          errorText: errorText.map { .raw($0) },
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
                                          errorText: errorText.map { .raw($0) },
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
