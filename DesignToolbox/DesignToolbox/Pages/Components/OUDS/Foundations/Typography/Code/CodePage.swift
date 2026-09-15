// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Code Page

struct CodePage: View {

    @StateObject private var configurationModel: CodeConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: CodeConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            CodeDemo(configurationModel: configurationModel)
        } configurationView: {
            CodeConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Code Demo

private struct CodeDemo: View {

    @StateObject var configurationModel: CodeConfigurationModel

    var body: some View {
        MISOCode(text: configurationModel.text)
    }
}
