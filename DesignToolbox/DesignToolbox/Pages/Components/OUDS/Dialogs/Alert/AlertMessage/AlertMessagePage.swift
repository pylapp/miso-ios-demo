// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: AlertMessage page

struct AlertMessagePage: View {

    @StateObject private var configurationModel: AlertMessageConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: AlertMessageConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            AlertMessageDemo(configurationModel: configurationModel)
        } configurationView: {
            AlertMessageConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - AlertMessage Demo

struct AlertMessageDemo: View {

    @StateObject var configurationModel: AlertMessageConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        // To keep things simple, assuming the rich/raw mode is for all parameters
        switch configurationModel.textMode {
        case .raw:
            MISOAlertMessage(label: configurationModel.text,
                             status: configurationModel.status(from: theme),
                             description: configurationModel.descriptionText,
                             bulletList: configurationModel.bulletList,
                             link: configurationModel.link,
                             onClose: configurationModel.onClose)
        case .rich:
            MISOAlertMessage(label: configurationModel.text,
                             status: configurationModel.status(from: theme),
                             description: configurationModel.richDescriptionText,
                             bulletList: configurationModel.richBulletList,
                             link: configurationModel.link,
                             onClose: configurationModel.onClose)
        }
    }
}
