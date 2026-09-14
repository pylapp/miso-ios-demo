// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Checkbox Page

/// Related to `MISOCheckbox` (i.e. with 2 available values).
struct CheckboxPage: View {

    @StateObject private var configurationModel: CheckboxConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: CheckboxConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            CheckboxDemo(configurationModel: configurationModel)
        } configurationView: {
            CheckboxConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Checkbox Demo

private struct CheckboxDemo: View {

    @ObservedObject var configurationModel: CheckboxConfigurationModel

    var body: some View {
        MISOCheckbox(isOn: $configurationModel.indicatorState,
                     accessibilityLabel: configurationModel.accessibilityLabel,
                     isError: configurationModel.isError,
                     isReadOnly: configurationModel.isReadOnly)
            .disabled(!configurationModel.enabled)
            .accessibilityIdentifier(A11YIdentifiers.componentCheckbox)
    }
}
