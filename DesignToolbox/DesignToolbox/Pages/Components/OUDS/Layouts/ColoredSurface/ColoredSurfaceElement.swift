// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct ColoredSurfaceElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_coloredBackground_tech".localized()
        illustration = AnyView(ColoredSurfaceIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_coloredBackground_description_text",
            demoScreen: AnyView(ColoredSurfacePage())))
    }
}

private struct ColoredSurfaceIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        MISOColoredSurface(color: theme.colorModes.onBrandPrimary) {
            Rectangle().fill(Color.clear)
        }
        .padding(.horizontal, theme.spaces.fixedSmall)
        .padding(.vertical, theme.spaces.fixedMedium)
    }
}
