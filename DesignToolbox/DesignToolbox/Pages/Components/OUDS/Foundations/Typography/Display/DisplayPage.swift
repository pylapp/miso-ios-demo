// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Display Page

struct DisplayPage: View {

    @StateObject private var configurationModel: DisplayConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: DisplayConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            DisplayDemo(configurationModel: configurationModel)
        } configurationView: {
            DisplayConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Display Demo

private struct DisplayDemo: View {

    @StateObject var configurationModel: DisplayConfigurationModel

    var body: some View {
        MISODisplay(text: configurationModel.text, size: configurationModel.size)
    }
}
