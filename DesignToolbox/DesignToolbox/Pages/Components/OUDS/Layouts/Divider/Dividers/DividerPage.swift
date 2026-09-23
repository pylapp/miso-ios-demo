// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Divider page

struct DividerPage: View {

    @StateObject private var configurationModel: DividerConfigurationModel

    init(orientation: DividerConfigurationModel.Orientation) {
        _configurationModel = StateObject(wrappedValue: DividerConfigurationModel(orientation: orientation))
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            DividerDemo(configurationModel: configurationModel)
        } configurationView: {
            DividerConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Divider Demo

struct DividerDemo: View {

    @StateObject var configurationModel: DividerConfigurationModel

    var body: some View {
        switch configurationModel.orientation {
        case .horizontal:
            MISOHorizontalDivider(color: configurationModel.selectedColor)
        case .vertical:
            MISOVerticalDivider(color: configurationModel.selectedColor)
        }
    }
}
