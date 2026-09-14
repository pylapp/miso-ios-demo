// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct HeadingElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_typography_heading_tech".localized()
        illustration = AnyView(HeadingIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_typography_heading_description_text",
            version: MISOVersions.componentTypographyVersion,
            demoScreen: AnyView(HeadingPage())))
    }
}

private struct HeadingIllustration: View {

    var body: some View {
        MISOHeading(text: "Aa", size: .small)
    }
}
