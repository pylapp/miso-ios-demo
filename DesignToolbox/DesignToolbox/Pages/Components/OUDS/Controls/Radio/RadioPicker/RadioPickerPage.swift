// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

// MARK: - Radio Picker Page

struct RadioPickerPage: View {

    @StateObject private var configurationModel: RadioPickerConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: RadioPickerConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            RadioPickerDemo(configurationModel: configurationModel)
        } configurationView: {
            RadioPickerConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Radio Picker Demo

private struct RadioPickerDemo: View {

    @State private var selection: String = "Choice_1" // cf configurationModel.populate()
    @ObservedObject var configurationModel: RadioPickerConfigurationModel

    var body: some View {
        MISORadioPicker(selection: $selection,
                        radios: configurationModel.populate(),
                        placement: configurationModel.pickerPlacement,
                        isOutlined: configurationModel.isOutlined,
                        isReversed: configurationModel.isReversed,
                        isError: configurationModel.isError,
                        isReadOnly: configurationModel.isReadOnly,
                        hasDivider: configurationModel.hasDivider)
            .disabled(!configurationModel.isEnabled)
    }
}

#endif
