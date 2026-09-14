// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - ControlItem Element Page

struct ControlItemElementPage<Demo>: View where Demo: View {

    // MARK: Stored properties

    @StateObject private var configurationModel: ControlItemConfigurationModel
    @ViewBuilder private var demo: () -> Demo

    // MARK: Initializer

    init(configurationModel: ControlItemConfigurationModel, demo: @escaping () -> Demo) {
        _configurationModel = StateObject(wrappedValue: configurationModel)
        self.demo = demo
    }

    // MARK: Body

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel, componentView: demo) {
            ControlItemConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - ControlItem Configuration View

private struct ControlItemConfigurationView: View {

    // MARK: Stored properties

    @ObservedObject var configurationModel: ControlItemConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                selection
                    .disabled(configurationModel.isError || configurationModel.isReadOnly)

                MISOSwitchItem("app_components_common_icon_tech", isOn: $configurationModel.icon)

                MISOSwitchItem("app_components_common_flipIcon_tech", isOn: $configurationModel.flipIcon)
                    .disabled(!configurationModel.icon || configurationModel.isError)

                MISOSwitchItem("app_components_common_rawImage_tech", isOn: $configurationModel.rawImage)
                    .disabled(!configurationModel.icon)

                if let outlinedConfiguration = configurationModel.outlinedConfiguration {
                    MISOSwitchItem(outlinedConfiguration.outlinedConfigurationLabel, isOn: $configurationModel.outlined)
                }

                MISOSwitchItem("app_components_controlItem_divider_tech", isOn: $configurationModel.hasDivider)

                MISOSwitchItem("app_components_common_constrainedMaxWidth_tech", isOn: $configurationModel.constrainedMaxWidth)

                MISOSwitchItem("app_components_controlItem_reversed_tech", isOn: $configurationModel.isReversed)

                MISOSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)
                    .disabled(configurationModel.isError || configurationModel.isReadOnly)

                MISOSwitchItem("app_components_common_readOnly_tech", isOn: $configurationModel.isReadOnly)
                    .disabled(!configurationModel.enabled || configurationModel.isError)

                MISOSwitchItem("app_components_common_error_tech", isOn: $configurationModel.isError)
                    .disabled(!configurationModel.enabled || configurationModel.isReadOnly)

                MISOChipPicker(title: "app_components_textMode_tech",
                               selection: $configurationModel.textMode,
                               chips: TextualContentMode.chips)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.labelText, label: "app_components_common_label_tech")

                if configurationModel.extraLabelConfiguration != nil {
                    DesignToolboxTextField(text: $configurationModel.extraLabelText, label: "app_components_common_extraLabel_tech")
                }

                DesignToolboxTextField(text: $configurationModel.descriptionText, label: "app_components_common_description_tech")

                if configurationModel.isError {
                    DesignToolboxTextField(text: $configurationModel.errorText, label: "app_components_common_errorMessage_tech")
                }
            }
        }
    }

    @ViewBuilder
    private var selection: some View {
        if let booleanModel = configurationModel as? BooleanControlItemConfigurationModel {
            BooleanSelectionView(model: booleanModel)
        }

        if let indeterminateModel = configurationModel as? IndicatorControlItemConfigurationModel {
            IndeterminateSelectionView(model: indeterminateModel)
        }
    }
}

// MARK: - Boolean Selection

private struct BooleanSelectionView: View {

    @ObservedObject var model: BooleanControlItemConfigurationModel

    var body: some View {
        MISOSwitchItem("app_components_common_selection_tech", isOn: $model.isOn)
            .accessibilityIdentifier(A11YIdentifiers.configurationSwitchSelection)
    }
}

// MARK: - Indeterminate Selection

private struct IndeterminateSelectionView: View {

    @ObservedObject var model: IndicatorControlItemConfigurationModel

    var body: some View {
        MISOChipPicker(title: "app_components_common_selection_tech",
                       selection: $model.selection,
                       chips: MISOCheckboxIndicatorState.chips)
    }
}
