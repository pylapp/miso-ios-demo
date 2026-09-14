// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Checkbox Indeterminate Page

/// Related to `MISOCheckboxIndeterminate` (i.e. with 3 available values).
struct CheckboxIndeterminatePage: View {

    @StateObject private var configurationModel: CheckboxIndeterminateConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: CheckboxIndeterminateConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            CheckboxIndeterminateDemo(configurationModel: configurationModel)
        } configurationView: {
            CheckboxIndeterminateConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Checkbox Indeterminate Demo

private struct CheckboxIndeterminateDemo: View {

    @ObservedObject var configurationModel: CheckboxIndeterminateConfigurationModel

    var body: some View {
        MISOCheckboxIndeterminate(selection: $configurationModel.indicatorState,
                                  accessibilityLabel: configurationModel.accessibilityLabel,
                                  isError: configurationModel.isError,
                                  isReadOnly: configurationModel.isReadOnly)
            .disabled(!configurationModel.enabled)
            .accessibilityIdentifier(A11YIdentifiers.componentCheckboxIndeterminate)
    }
}
