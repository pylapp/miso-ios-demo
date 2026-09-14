// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

// MARK: - ToolBar Principal Configuration

struct ToolBarPrincipalConfiguration: View {

    @StateObject var configurationModel: ToolBarConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            MISOChipPicker(title: "app_components_toolbar_principalType_tech",
                           selection: $configurationModel.principalType,
                           chips: PrincipalType.chips)

            if configurationModel.principalType != .none {
                switch configurationModel.principalType {
                case .none:
                    EmptyView()
                case .icon:
                    MISOChipPicker(title: "app_components_badge_tech".localized(),
                                   selection: $configurationModel.badgeType,
                                   chips: BarItemBadgeType.chips)
                case .label:
                    EmptyView()
                case .custom:
                    EmptyView()
                }
            }
        }
    }
}

#endif
