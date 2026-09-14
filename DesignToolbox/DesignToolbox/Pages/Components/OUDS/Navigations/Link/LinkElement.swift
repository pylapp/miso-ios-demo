// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct LinkElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_link_tech".localized()
        illustration = AnyView(LinkIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_link_description_text",
            version: MISOVersions.componentLinkVersion,
            demoScreen: AnyView(LinkPage())))
    }
}

private struct LinkIllustration: View {

    @Environment(\.layoutDirection) var direction

    var body: some View {
        MISOLink("app_components_common_label_label", indicator: .next) {}
    }
}
