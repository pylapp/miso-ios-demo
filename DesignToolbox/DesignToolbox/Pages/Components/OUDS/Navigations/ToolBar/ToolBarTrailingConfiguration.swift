// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

// MARK: - Toolbar Trailing Configuration

struct ToolBarTrailingConfiguration: View {

    @StateObject var configurationModel: ToolBarConfigurationModel
    @Environment(\.theme) private var theme
    @Environment(\.isLiquidGlassDisabled) private var isLiquidGlassDisabled

    var body: some View {
        MISOChipPicker(title: "app_components_toolbar_trailing_tech".localized(),
                       selection: $configurationModel.trailing,
                       chips: LeadingTrailingType.chips)

        switch configurationModel.trailing {
        case .label, .icon:
            Stepper("app_components_common_itemCount_label" <- "\(configurationModel.numberOfTrailingItems)",
                    value: $configurationModel.numberOfTrailingItems,
                    in: 1 ... 3)
                .padding(.horizontal, theme.spaces.fixedMedium)
                .labelStrongMedium(theme)

            if isLiquidGlassDisabled,
               configurationModel.trailing == .label
            {
                MISOSwitchItem("app_components_toolbar_item_emphasized_tech", isOn: $configurationModel.isTrailingEmphasized)
            }

        default:
            EmptyView()
        }

        switch configurationModel.trailing {
        case .none:
            EmptyView()
        default:
            MISOSwitchItem("app_common_enabled_tech", isOn: $configurationModel.isTrailingEnabled)
        }
    }
}

#endif
