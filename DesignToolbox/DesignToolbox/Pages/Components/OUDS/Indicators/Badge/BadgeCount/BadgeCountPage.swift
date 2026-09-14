// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Badge Count Page

struct BadgeCountPage: View {

    @StateObject private var configurationModel: BadgeCountConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: BadgeCountConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            BadgeCountDemo(configurationModel: configurationModel)
        } configurationView: {
            BadgeCountConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Badge Count Demo

struct BadgeCountDemo: View {

    @StateObject var configurationModel: BadgeCountConfigurationModel

    var body: some View {
        MISOBadgeCount(configurationModel.count,
                       accessibilityLabel: "app_components_badge_hint_a11y".localized(),
                       status: configurationModel.status,
                       size: configurationModel.countSize)
            .disabled(!configurationModel.enabled)
    }
}
