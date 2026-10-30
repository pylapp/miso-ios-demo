// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI

struct BorderTokenElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_tokens_border_tech".localized()
        illustration = AnyView(Image(decorative: "ic_border").renderingMode(.template))
        #if os(iOS)
        if #available(iOS 27.1, *) { // Trick for iPhone Duo
            pageDescription = AnyView(BorderTokenDetailPage(illustration: illustration))
            return
        }
        #endif
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_tokens_border_description_text",
            demoScreen: AnyView(BorderTokenPage())))
    }
}
