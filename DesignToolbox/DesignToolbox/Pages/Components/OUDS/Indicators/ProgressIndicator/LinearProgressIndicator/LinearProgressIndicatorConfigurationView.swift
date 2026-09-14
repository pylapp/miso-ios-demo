// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOComponents
import MISOSwiftUI
import SwiftUI

// swiftlint:disable type_name

// MARK: - Linear Progress Indicator Configuration Model

/// The model shared between `LinearProgressIndicatorConfigurationView` and `LinearProgressIndicatorDemo`.
final class LinearProgressIndicatorConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var variant: Variant {
        didSet { updateCode() }
    }

    @Published var progress: Double {
        didSet { updateCode() }
    }

    @Published var status: MISOProgressIndicatorStatus {
        didSet { updateCode() }
    }

    @Published var track: Bool {
        didSet { updateCode() }
    }

    @Published var stopIndicator: Bool {
        didSet { updateCode() }
    }

    @Published var determinateHelperTextType: DeterminateProgressIndicatorHelperType {
        didSet { updateCode() }
    }

    @Published var helperTextAlignment: MISOLinearProgressIndicator.HelperTextAlignment {
        didSet { updateCode() }
    }

    @Published var helperText: String {
        didSet { updateCode() }
    }

    @Published var gapSize: MISOProgressIndicatorGapSize {
        didSet { updateCode() }
    }

    @Published var animated: Bool {
        didSet { updateCode() }
    }

    @Published var accessibilityName: String {
        didSet { updateCode() }
    }

    @Published var accessibilityState: String {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        variant = .determinate
        progress = 0.75
        status = .neutral
        track = true
        stopIndicator = false
        gapSize = .default
        animated = true

        determinateHelperTextType = .percent
        helperTextAlignment = .start
        helperText = "app_components_pinCodeInput_helper_label".localized()
        helperTextAlignment = .center

        accessibilityName = ""
        accessibilityState = ""

        super.init()
    }

    deinit {}

    // MARK: Helper text

    /// The actual `String?` value passed to the indeterminet component: nil when the field is empty,
    /// the user-entered text otherwise.
    var helperTextValue: String? {
        helperText.isEmpty ? nil : helperText
    }

    /// The `MISOLinearProgressIndicator.HelperTextType?` passed to the determinate
    /// progress indicator.
    var determinateHelperTextValue: MISOLinearProgressIndicator.HelperTextType? {
        switch determinateHelperTextType {
        case .none:
            nil
        case .percent:
            .percent(description: helperTextValue, alignment: helperTextAlignment)
        case .description:
            .description(helperText, alignment: helperTextAlignment)
        }
    }

    var accessibilityConfiguration: MISOAccessibilityConfiguration? {
        if accessibilityName.isEmpty, accessibilityState.isEmpty {
            return nil
        }
        return MISOAccessibilityConfiguration(name: accessibilityName.isEmpty ? nil : accessibilityName,
                                              state: accessibilityState.isEmpty ? nil : accessibilityState)
    }

    // MARK: Component Configuration

    override func updateCode() {
        switch variant {
        case .determinate:
            code = """
            MISOLinearProgressIndicator(progress: \(String(format: "%.2f", progress)), \
            \(statusPattern), \(trackPattern), \(stopIndicatorPattern), \
            \(accessibilityPattern)\(determinateHelperTextPattern), \
            \(gapSizePattern), \(animatedPattern))\(coloredSurfacePattern)
            """
        case .indeterminate:
            code = """
            MISOLinearProgressIndicator(\(statusPattern), \(trackPattern), \
            \(accessibilityPattern)\(indeterminateHelperTextPattern), \(gapSizePattern))\(coloredSurfacePattern)
            """
        }
    }

    private var statusPattern: String {
        "status: \(status.technicalDescription)"
    }

    private var trackPattern: String {
        "track: \(track)"
    }

    private var stopIndicatorPattern: String {
        "stopIndicator: \(stopIndicator)"
    }

    private var determinateHelperTextPattern: String {
        switch determinateHelperTextType {
        case .none:
            return ""
        case .percent:
            let descriptionPattern = helperText.isEmpty ? "" : "description: \"\(helperText)\", "
            return ", helperText: .percent(\(descriptionPattern)alignment: \(helperTextAlignment.technicalDescription))"
        case .description:
            return ", helperText: .description(\"\(helperText)\", alignment: \(helperTextAlignment.technicalDescription))"
        }
    }

    private var indeterminateHelperTextPattern: String {
        if let value = helperTextValue {
            return "helperText: \"\(value)\", helperTextAlignment: \(helperTextAlignment.technicalDescription)"
        }
        return "helperText: nil"
    }

    private var gapSizePattern: String {
        "gapSize: \(gapSize.technicalDescription)"
    }

    private var animatedPattern: String {
        "animated: \(animated)"
    }

    private var coloredSurfacePattern: String {
        onColoredSurface ? "\n    .coloredSurface(theme.colorModes.onBrandPrimary)" : ""
    }

    private var accessibilityPattern: String {
        if let config = accessibilityConfiguration {
            let namePart = config.name.map { "\"\($0)\"" } ?? "nil"
            let statePart = config.state.map { "\"\($0)\"" } ?? "nil"
            return ", accessibility: .init(name: \(namePart), state: \(statePart))"
        }
        return ""
    }

    // MARK: - Variant

    enum Variant: CaseIterable, Hashable, DesignToolboxEnumRepresentable {
        case determinate
        case indeterminate
    }
}

// MARK: - Linear Progress Indicator Configuration View

struct LinearProgressIndicatorConfigurationView: View {

    // MARK: Properties

    @StateObject var configurationModel: LinearProgressIndicatorConfigurationModel

    @Environment(\.theme) private var theme

    // MARK: Body

    // swiftlint:disable closure_body_length
    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                MISOChipPicker(title: "app_components_progressIndicator_variant_tech",
                               selection: $configurationModel.variant,
                               chips: LinearProgressIndicatorConfigurationModel.Variant.chips)

                MISOSwitchItem("app_components_common_onColoredSurface_tech",
                               isOn: $configurationModel.onColoredSurface)

                if configurationModel.variant == .determinate {
                    DesignToolboxProgressControl(progress: $configurationModel.progress)
                }

                MISOChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.status,
                               chips: MISOProgressIndicatorStatus.chips)
                    .disabled(configurationModel.onColoredSurface)

                MISOSwitchItem("app_components_progressIndicator_track_tech",
                               isOn: $configurationModel.track)

                MISOChipPicker(title: "app_components_progressIndicator_gapSize_tech",
                               selection: $configurationModel.gapSize,
                               chips: MISOProgressIndicatorGapSize.chips)

                if configurationModel.variant == .determinate {
                    MISOSwitchItem("app_components_animated_tech",
                                   isOn: $configurationModel.animated)

                    MISOSwitchItem("app_components_progressIndicator_stopIndicator_tech",
                                   isOn: $configurationModel.stopIndicator)

                    MISOHorizontalDivider()

                    MISOChipPicker(title: "app_components_progressIndicator_helperText_type_tech",
                                   selection: $configurationModel.determinateHelperTextType,
                                   chips: DeterminateProgressIndicatorHelperType.chips)
                }

                if configurationModel.variant == .indeterminate && configurationModel.helperTextValue != nil
                    || configurationModel.variant == .determinate && configurationModel.determinateHelperTextType != .none
                {
                    MISOChipPicker(title: "app_components_common_contentAlignment_tech",
                                   selection: $configurationModel.helperTextAlignment,
                                   chips: MISOLinearProgressIndicator.HelperTextAlignment.chips)
                }
            }

            if configurationModel.variant == .indeterminate ||
                (configurationModel.variant == .determinate &&
                    ((configurationModel.determinateHelperTextType == .percent && configurationModel.helperTextAlignment != .center)
                        || configurationModel.determinateHelperTextType == .description))
            {
                DesignToolboxEditContentDisclosure(isContentVisible: true) {
                    DesignToolboxTextField(text: $configurationModel.helperText,
                                           label: "app_components_progressIndicator_helperText_tech")
                }
            }

            DesignToolboxEditContentDisclosure(isContentVisible: true) {
                VStack(spacing: theme.spaces.fixedSmall) {
                    DesignToolboxTextField(text: $configurationModel.accessibilityName,
                                           label: "app_components_a11y_name_tech")
                    DesignToolboxTextField(text: $configurationModel.accessibilityState,
                                           label: "app_components_a11y_state_tech")
                }
            }
        }
    }
    // swiftlint:enable closure_body_length
}

// MARK: - MISO enum representable extensions

extension MISOLinearProgressIndicator.HelperTextAlignment: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOLinearProgressIndicator.HelperTextAlignment] = [.center, .start, .end]
}

enum DeterminateProgressIndicatorHelperType: DesignToolboxEnumRepresentable {
    case none
    case percent
    case description
}

// swiftlint:enable type_name
