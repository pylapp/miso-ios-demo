// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Radio Page

struct RadioPage: View {

    @StateObject private var configurationModel: RadioConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: RadioConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            RadioDemo(configurationModel: configurationModel)
        } configurationView: {
            RadioConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Radio Demo

private struct RadioDemo: View {

    @ObservedObject var configurationModel: RadioConfigurationModel

    var body: some View {
        MISORadio(isOn: $configurationModel.selection,
                  accessibilityLabel: "app_components_radioButton_hint_a11y".localized(), // No LocalizedStringKey type inference in the component
                  isError: configurationModel.isError,
                  isReadOnly: configurationModel.isReadOnly)
            .disabled(!configurationModel.enabled)
            .accessibilityIdentifier(A11YIdentifiers.componentRadio)
    }
}
