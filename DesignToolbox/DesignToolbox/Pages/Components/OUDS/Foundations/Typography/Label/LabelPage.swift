// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Label Page

struct LabelPage: View {

    @StateObject private var configurationModel: LabelConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: LabelConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            LabelDemo(configurationModel: configurationModel)
        } configurationView: {
            LabelConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Label Demo

private struct LabelDemo: View {

    @StateObject var configurationModel: LabelConfigurationModel

    var body: some View {
        MISOLabel(text: configurationModel.text, size: configurationModel.size, weight: configurationModel.weight)
    }
}
