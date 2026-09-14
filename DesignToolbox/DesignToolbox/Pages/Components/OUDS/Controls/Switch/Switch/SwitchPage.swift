// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Switch Page

struct SwitchPage: View {

    @StateObject private var configurationModel: SwitchConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: SwitchConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            SwitchDemo(configurationModel: configurationModel)
        } configurationView: {
            SwitchConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Switch Demo

private struct SwitchDemo: View {

    @ObservedObject var configurationModel: SwitchConfigurationModel

    var body: some View {
        MISOSwitch(isOn: $configurationModel.selection,
                   accessibilityLabel: "app_components_switch_hint_a11y".localized(), // No LocalizedStringKey type inference in the component
                   isReadOnly: configurationModel.isReadOnly)
            .disabled(!configurationModel.enabled)
            .accessibilityIdentifier(A11YIdentifiers.componentSwitch)
    }
}
