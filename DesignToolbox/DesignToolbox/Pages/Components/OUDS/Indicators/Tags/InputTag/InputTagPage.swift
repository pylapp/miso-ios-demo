// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Input Tag page

struct InputTagPage: View {

    @StateObject private var configurationModel: InputTagConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: InputTagConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            InputTagDemo(configurationModel: configurationModel)
        } configurationView: {
            InputTagConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Input Tag Demo

struct InputTagDemo: View {

    @StateObject var configurationModel: InputTagConfigurationModel

    var body: some View {
        MISOInputTag(label: configurationModel.label) {}
            .disabled(!configurationModel.enabled)
    }
}
