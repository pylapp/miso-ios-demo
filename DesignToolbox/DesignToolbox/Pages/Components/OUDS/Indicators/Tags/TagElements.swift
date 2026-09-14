// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct TagElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            TagElement(),
            InputTagElement(),
        ]

        name = "app_components_tag_tech".localized()
        illustration = AnyView(TagIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_tag_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

private struct TagIllustration: View {

    var body: some View {
        MISOTag("app_components_common_label_label",
                status: .positive(leading: .none),
                appearance: .emphasized,
                shape: .rounded,
                size: .default)
    }
}
