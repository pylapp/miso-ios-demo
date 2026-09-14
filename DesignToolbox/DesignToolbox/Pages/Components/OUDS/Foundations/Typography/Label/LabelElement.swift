// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct LabelElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_typography_label_tech".localized()
        illustration = AnyView(LabelIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_typography_label_description_text",
            version: MISOVersions.componentTypographyVersion,
            demoScreen: AnyView(LabelPage())))
    }
}

private struct LabelIllustration: View {

    var body: some View {
        MISOLabel(text: "Aa", size: .medium, weight: .strong)
    }
}
