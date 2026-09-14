// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Badge Standard Page

struct BadgeStandardPage: View {

    @StateObject private var configurationModel: BadgeStandardConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: BadgeStandardConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            BadgeStandardDemo(configurationModel: configurationModel)
        } configurationView: {
            BadgeStandardConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Badge Standard Demo

struct BadgeStandardDemo: View {

    @StateObject var configurationModel: BadgeStandardConfigurationModel

    var body: some View {
        MISOBadgeStandard(accessibilityLabel: "app_components_badge_hint_a11y".localized(),
                          status: configurationModel.status,
                          size: configurationModel.standardSize)
            .disabled(!configurationModel.enabled)
    }
}
