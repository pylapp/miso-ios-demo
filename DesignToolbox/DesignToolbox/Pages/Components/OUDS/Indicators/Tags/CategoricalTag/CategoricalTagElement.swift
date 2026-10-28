// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct CategoricalTagElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_tag_categoricalTag_tech".localized()
        illustration = AnyView(MISOCategoricalTag(label: "app_components_common_label_label",
                                                  category: .category1,
                                                  leading: .bullet,
                                                  shape: .rounded,
                                                  size: .default))
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_tag_categoricalTag_description_text",
            version: MISOVersions.componentCategoricalTagVersion,
            demoScreen: AnyView(CategoricalTagPage())))
    }
}
