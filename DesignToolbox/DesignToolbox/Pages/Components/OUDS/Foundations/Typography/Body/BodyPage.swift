// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Body Page

struct BodyPage: View {

    @StateObject private var configurationModel: BodyConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: BodyConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            BodyDemo(configurationModel: configurationModel)
        } configurationView: {
            BodyConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Body Demo

private struct BodyDemo: View {

    @StateObject var configurationModel: BodyConfigurationModel

    var body: some View {
        MISOBody(text: configurationModel.text, size: configurationModel.size, weight: configurationModel.weight)
    }
}
