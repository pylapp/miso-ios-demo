// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

// MARK: - Toolbar Item Style

struct ToolBarItemStyle: View {

    @StateObject var configurationModel: ToolBarConfigurationModel
    @Environment(\.isLiquidGlassDisabled) private var isLiquidGlassDisabled

    var body: some View {
        if !isLiquidGlassDisabled,
           configurationModel.trailing == .icon ||
           configurationModel.leading == .icon ||
           configurationModel.trailing == .label ||
           configurationModel.leading == .label
        {

            MISOHorizontalDivider()

            MISOChipPicker(title: "app_components_toolbar_item_ios26ButtonStyle_tech",
                           selection: $configurationModel.ios26ButtonStyle,
                           chips: MISOToolBarItem.ActionStyle.chips)
        }
    }
}

#endif
