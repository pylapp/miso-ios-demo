// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct DividerElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            DividerElement(orientation: .horizontal),
            DividerElement(orientation: .vertical),
        ]

        name = "app_components_divider_tech".localized()
        illustration = AnyView(DividerIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_divider_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

private struct DividerIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack {
            Spacer()
            #if !os(visionOS)
            MISOHorizontalDivider(color: .default)
            #else
            MISOHorizontalDivider(color: .brandPrimary)
            #endif
            Spacer()
        }
        .padding(.horizontal, theme.spaces.fixedMedium)
    }
}
