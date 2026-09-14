// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Navigation List Item Page

struct NavigationListItemPage: View {

    @StateObject private var configurationModel = NavigationListItemConfigurationModel()

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            NavigationListItemDemo(configurationModel: configurationModel)
        } configurationView: {
            NavigationListItemConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Navigation List Item Demo

private struct NavigationListItemDemo: View {

    @ObservedObject private var configurationModel: NavigationListItemConfigurationModel
    @ObservedObject private var textsModel: ListItemTextsConfigurationModel
    @ObservedObject private var leadingModel: ListItemLeadingConfigurationModel
    @ObservedObject private var trailingModel: ListItemTrailingConfigurationModel

    @Environment(\.theme) private var theme

    init(configurationModel: NavigationListItemConfigurationModel) {
        self.configurationModel = configurationModel
        textsModel = configurationModel.textsModel
        leadingModel = configurationModel.leadingModel
        trailingModel = configurationModel.trailingModel
    }

    var body: some View {
        VStack(spacing: rowGap) {
            ForEach(Array(configurationModel.dataItems.enumerated()), id: \.offset) { _, data in
                MISONavigationListItem(data: data,
                                       indicatorType: configurationModel.indicatorType,
                                       leading: leadingModel.item(for: theme),
                                       trailing: trailingModel.item(for: theme)) {}
            }
        }
        .misoListContentStyle(configurationModel.contentStyle)
        .misoListItemContainerAlignment(configurationModel.containersAlignment)
        .misoListItemRoundedMedia(configurationModel.roundedMedia)
        .misoListItemSize(configurationModel.itemSize)
        .disabled(!configurationModel.enabled)
    }

    private var rowGap: CGFloat {
        switch configurationModel.contentStyle {
        case .card:
            theme.spaces.fixedLarge
        case .item:
            theme.spaces.fixedNone
        }
    }
}
