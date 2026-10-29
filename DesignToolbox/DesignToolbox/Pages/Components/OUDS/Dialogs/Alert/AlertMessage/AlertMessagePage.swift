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
        Group {
            // To keep things simple, assuming the rich/raw mode is for all parameters
            switch configurationModel.textMode {
            case .raw:
                MISOAlertMessage(label: configurationModel.text,
                                 status: configurationModel.status(from: theme),
                                 description: .raw(configurationModel.descriptionText),
                                 bulletList: configurationModel.bulletList.map { .raw($0) },
                                 link: configurationModel.link,
                                 onClose: configurationModel.onClose)
            case .rich:
                MISOAlertMessage(label: configurationModel.text,
                                 status: configurationModel.status(from: theme),
                                 description: .rich(configurationModel.richDescriptionText),
                                 bulletList: configurationModel.richBulletList.map { .rich($0) },
                                 link: configurationModel.link,
                                 onClose: configurationModel.onClose)
            }
        }
        .showSkeleton(isVisible: configurationModel.showSkeleton)
    }
}
