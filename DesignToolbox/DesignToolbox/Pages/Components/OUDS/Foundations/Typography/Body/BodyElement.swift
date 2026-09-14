// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct BodyElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_typography_body_tech".localized()
        illustration = AnyView(BodyIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_typography_body_description_text",
            version: MISOVersions.componentTypographyVersion,
            demoScreen: AnyView(BodyPage())))
    }
}

private struct BodyIllustration: View {

    var body: some View {
        MISOBody(text: "Aa", size: .medium, weight: .strong)
    }
}
