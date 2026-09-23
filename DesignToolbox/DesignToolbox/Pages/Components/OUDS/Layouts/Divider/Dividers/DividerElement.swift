// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct DividerElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init(orientation: DividerConfigurationModel.Orientation) {
        let keyPattern = orientation == .horizontal ? "horizontalDivider" : "verticalDivider"
        let keyForName = "app_components_divider_\(keyPattern)_tech"
        let keyForDescription = "app_components_divider_\(keyPattern)_description_text"

        name = keyForName.localized()
        illustration = AnyView(EmptyView())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: keyForDescription.localized(),
            version: MISOVersions.componentDividerVersion,
            demoScreen: AnyView(DividerPage(orientation: orientation))))
    }
}
