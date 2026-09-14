// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI

struct SpaceTokenElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_tokens_dimension_space_tech".localized()
        illustration = AnyView(Image(decorative: "ic_dimension").renderingMode(.template))
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_tokens_dimension_space_description_text",
            demoScreen: AnyView(SpaceTokenPage())))
    }
}
