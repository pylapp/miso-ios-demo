// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

// MARK: - Checkbox Picker Page

struct CheckboxPickerPage: View {

    @StateObject private var configurationModel: CheckboxPickerConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: CheckboxPickerConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            CheckboxPickerDemo(configurationModel: configurationModel)
        } configurationView: {
            CheckboxPickerConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Checkbox Picker Demo

private struct CheckboxPickerDemo: View {

    @State private var selections: [String] = []
    @ObservedObject var configurationModel: CheckboxPickerConfigurationModel

    var body: some View {
        MISOCheckboxPicker(selections: $selections,
                           checkboxes: configurationModel.populate(),
                           placement: configurationModel.pickerPlacement,
                           isReversed: configurationModel.isReversed,
                           isError: configurationModel.isError,
                           isReadOnly: configurationModel.isReadOnly,
                           hasDivider: configurationModel.hasDivider)
            .disabled(!configurationModel.isEnabled)
    }
}

#endif
