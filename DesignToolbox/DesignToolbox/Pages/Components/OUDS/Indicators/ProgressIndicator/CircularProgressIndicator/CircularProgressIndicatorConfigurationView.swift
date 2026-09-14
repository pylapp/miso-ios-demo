// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOComponents
import MISOSwiftUI
import SwiftUI

// swiftlint:disable type_name

// MARK: - Circular Progress Indicator Configuration Model

/// The model shared between `CircularProgressIndicatorConfigurationView` and `CircularProgressIndicatorDemo`.
final class CircularProgressIndicatorConfigurationModel: ComponentConfiguration {

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

    @Published var gapSize: MISOProgressIndicatorGapSize {
        didSet { updateCode() }
    }

    @Published var animated: Bool {
        didSet { updateCode() }
    }

    @Published var helperTextType: ProgressIndicatorHelperType {
        didSet { updateCode() }
    }

    @Published var helperText: String {
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
        gapSize = .default
        animated = true

        helperTextType = .percent
        helperText = ""

        accessibilityName = ""
        accessibilityState = ""

        super.init()
    }

    deinit {}

    // MARK: Helper text

    /// The actual `String?` value passed to the indeterminate component: nil when the field is empty,
    /// the user-entered text otherwise.
    var helperTextValue: String? {
        helperText.isEmpty ? nil : helperText
    }

    /// The `OUDSDeterminateProgressIndicatorHelperText?` passed to the determinate
    /// progress indicator.
    var determinateHelperTextValue: MISOCircularProgressIndicator.HelperTextType? {
        switch helperTextType {
        case .none:
            nil
        case .percent:
            .percent(helperTextValue)
        case .description:
            .description(helperText)
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
            MISOCircularProgressIndicator(progress: \(String(format: "%.2f", progress)), \
            \(statusPattern), \(trackPattern), \(gapSizePattern), \(animatedPattern)\
            \(accessibilityPattern)\(determinateHelperTextPattern))\(coloredSurfacePattern)
            """
        case .indeterminate:
            code = """
            MISOCircularProgressIndicator(\(statusPattern), \(trackPattern), \(gapSizePattern), \
            \(accessibilityPattern)\(indeterminateHelperTextPattern))\(coloredSurfacePattern)
            """
        }
    }

    private var statusPattern: String {
        "status: \(status.technicalDescription)"
    }

    private var trackPattern: String {
        "track: \(track)"
    }

    private var gapSizePattern: String {
        "gapSize: \(gapSize.technicalDescription)"
    }

    private var animatedPattern: String {
        "animated: \(animated)"
    }

    private var determinateHelperTextPattern: String {
        if let helperText = determinateHelperTextValue {
            switch helperText {
            case let .description(description):
                return ", helperText: .description(\"\(description)\")"
            case let .percent(description):
                let descPattern = description.map { "\"\($0)\"" } ?? ""
                return ", helperText: .percent(\(descPattern))"
            }
        }
        return ""
    }

    private var indeterminateHelperTextPattern: String {
        if let value = helperTextValue {
            return ", helperText: \"\(value)\""
        }
        return ""
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

// MARK: - Circular Progress Indicator Configuration View

struct CircularProgressIndicatorConfigurationView: View {

    // MARK: Properties

    @StateObject var configurationModel: CircularProgressIndicatorConfigurationModel

    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            MISOChipPicker(title: "app_components_progressIndicator_variant_tech",
                           selection: $configurationModel.variant,
                           chips: CircularProgressIndicatorConfigurationModel.Variant.chips)

            MISOSwitchItem("app_components_common_onColoredSurface_tech",
                           isOn: $configurationModel.onColoredSurface)

            if configurationModel.variant == .determinate {
                DesignToolboxProgressControl(progress: $configurationModel.progress)

                MISOSwitchItem("app_components_animated_tech",
                               isOn: $configurationModel.animated)
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
                MISOHorizontalDivider()

                MISOChipPicker(title: "app_components_progressIndicator_helperText_type_tech",
                               selection: $configurationModel.helperTextType,
                               chips: ProgressIndicatorHelperType.chips)
            }
        }

        DesignToolboxEditContentDisclosure(isContentVisible: true) {
            VStack(spacing: theme.spaces.fixedSmall) {
                if configurationModel.variant == .indeterminate ||
                    (configurationModel.variant == .determinate &&
                        (configurationModel.helperTextType == .percent ||
                            configurationModel.helperTextType == .description))
                {

                    DesignToolboxTextField(text: $configurationModel.helperText,
                                           label: "app_components_progressIndicator_helperText_tech")
                }

                DesignToolboxTextField(text: $configurationModel.accessibilityName,
                                       label: "app_components_a11y_name_tech")
                DesignToolboxTextField(text: $configurationModel.accessibilityState,
                                       label: "app_components_a11y_state_tech")
            }
        }
    }
}

// MARK: - Helper text type

enum ProgressIndicatorHelperType: DesignToolboxEnumRepresentable {
    case none
    case percent
    case description
}

// swiftlint:enable type_name
