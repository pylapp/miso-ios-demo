// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct TagElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_tag_tag_tech".localized()
        illustration = AnyView(MISOTag("app_components_common_label_label", status: .positive(leading: .icon), appearance: .emphasized, shape: .rounded, size: .default))
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_tag_tag_description_text",
            version: MISOVersions.componentTagVersion,
            demoScreen: AnyView(TagPage())))
    }
}
