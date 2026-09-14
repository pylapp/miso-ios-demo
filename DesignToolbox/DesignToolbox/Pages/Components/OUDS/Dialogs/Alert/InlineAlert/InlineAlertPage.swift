// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Inline Alert page

struct InlineAlertPage: View {

    @StateObject private var configurationModel: InlineAlertConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: InlineAlertConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            InlineAlertDemo(configurationModel: configurationModel)
        } configurationView: {
            InlineAlertConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Inline Alert Demo

struct InlineAlertDemo: View {

    @StateObject var configurationModel: InlineAlertConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        HStack(alignment: .center) {
            MISOInlineAlert(label: configurationModel.text, status: configurationModel.status(from: theme))
        }
        .padding(.all, theme.spaces.fixedMedium)
    }
}
