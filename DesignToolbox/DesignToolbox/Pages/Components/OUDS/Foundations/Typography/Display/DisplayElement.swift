// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct DisplayElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_typography_display_tech".localized()
        illustration = AnyView(DisplayIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_typography_display_description_text",
            version: MISOVersions.componentTypographyVersion,
            demoScreen: AnyView(DisplayPage())))
    }
}

private struct DisplayIllustration: View {

    var body: some View {
        MISODisplay(text: "Aa", size: .small)
    }
}
