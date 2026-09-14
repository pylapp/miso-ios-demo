// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI

struct GridTokenElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init(themeName: String) {
        name = "app_tokens_grid_tech".localized()
        illustration = AnyView(Image.decorativeImage(named: "menu-grid", prefixedBy: themeName))
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_tokens_grid_description_text",
            demoScreen: AnyView(GridTokenPage())))
    }
}
