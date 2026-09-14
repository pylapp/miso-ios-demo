// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct ListItemGlobalSettingsConfiguration: View {

    @ObservedObject var configurationModel: ListItemConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: 0) {
            MISOChipPicker(title: "app_components_common_type_tech".localized(),
                           selection: $configurationModel.contentStyleOption,
                           chips: ListItemConfigurationModel.ListContentStyle.chips)

            switch configurationModel.contentStyleOption {
            case .card:
                MISOChipPicker(title: "app_components_listItem_cardDecoration_tech".localized(),
                               selection: $configurationModel.contentCardDecorationOption,
                               chips: ListItemContentCardStyle.chips)
                switch configurationModel.contentCardDecorationOption {
                case .outlined:
                    if configurationModel is NavigationListItemConfigurationModel {
                        MISOSwitchItem("app_components_listItem_outlinedOnInteraction_tech", isOn: $configurationModel.outlinedOnInteractionOnly)
                    }

                case .strandard:
                    MISOSwitchItem("app_components_controlItem_divider_tech", isOn: $configurationModel.hasDivider)

                    MISOSwitchItem("app_components_listItem_background_tech", isOn: $configurationModel.hasBackground)
                }

            case .item:
                MISOSwitchItem("app_components_controlItem_divider_tech", isOn: $configurationModel.hasDivider)

                MISOSwitchItem("app_components_listItem_background_tech", isOn: $configurationModel.hasBackground)
            }

            MISOHorizontalDivider()

            MISOChipPicker(title: "app_components_listItem_size_tech".localized(),
                           selection: $configurationModel.itemSize,
                           chips: MISOListItemSize.chips)

            MISOHorizontalDivider()

            MISOChipPicker(title: "app_components_common_contentAlignment_tech".localized(),
                           selection: $configurationModel.containersAlignment,
                           chips: MISOListItemContainersAlignment.chips)

            MISOHorizontalDivider()

            MISOSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

            if configurationModel.needRoundedMediaOption {
                MISOHorizontalDivider()

                MISOSwitchItem("app_components_listItem_roundedMedia_tech", isOn: $configurationModel.roundedMedia)
            }

            MISOHorizontalDivider()

            #if !os(tvOS)
            Stepper("app_components_common_itemCount_label" <- "\($configurationModel.numberOfItems.wrappedValue)",
                    value: $configurationModel.numberOfItems,
                    in: 1 ... 15,
                    step: 1)
                .padding(.all, theme.spaces.fixedMedium)
                .labelStrongMedium(theme)
            #endif
        }
    }
}
