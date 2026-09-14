// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI

struct ColorTokenElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init(themeName: String) {
        name = "app_tokens_color_tech".localized()
        illustration = AnyView(Image.decorativeImage(named: "palette", prefixedBy: themeName))
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_tokens_color_description_text",
            demoScreen: AnyView(ColorTokenPage())))
    }
}
