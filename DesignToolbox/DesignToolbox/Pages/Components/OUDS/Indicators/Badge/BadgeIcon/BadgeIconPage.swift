// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Badge Icon Page

struct BadgeIconPage: View {

    @StateObject private var configurationModel = BadgeIconConfigurationModel()

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            BadgeIconDemo(configurationModel: configurationModel)
        } configurationView: {
            BadgeIconConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Badge Icon Demo

struct BadgeIconDemo: View {

    @ObservedObject var configurationModel: BadgeIconConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        MISOBadgeIcon(status: configurationModel.statusWithIcon(from: theme),
                      accessibilityLabel: "app_components_badge_hint_a11y".localized(),
                      size: configurationModel.size)
            .disabled(!configurationModel.enabled)
            .id(theme.name) // Hack to be sure the image of the badge is the good one depending to the thame
    }
}
