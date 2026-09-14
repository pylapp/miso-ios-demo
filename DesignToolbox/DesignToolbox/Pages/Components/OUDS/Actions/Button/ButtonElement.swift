// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct ButtonElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_button_tech".localized()
        illustration = AnyView(ButtonIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_button_description_text",
            version: MISOVersions.componentButtonVersion,
            demoScreen: AnyView(ButtonPage())))
    }
}

private struct ButtonIllustration: View {

    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        VStack(spacing: theme.spaces.fixedSmall) {
            #if !os(visionOS)
            MISOButton("app_components_common_label_label", appearance: colorScheme == .light ? .strong : .default) {}
            MISOButton("app_components_common_label_label", appearance: colorScheme == .light ? .default : .strong) {}
            #else
            MISOButton("app_components_common_label_label", appearance: .default) {}
            #endif
        }
    }
}
