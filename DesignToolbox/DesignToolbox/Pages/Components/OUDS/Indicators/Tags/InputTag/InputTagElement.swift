// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct InputTagElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_tag_inputTag_tech".localized()
        illustration = AnyView(MISOTag("app_components_common_label_label", status: .neutral(), appearance: .emphasized, shape: .rounded, size: .default))
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_tag_inputTag_description_text",
            version: MISOVersions.componentInputTagVersion,
            demoScreen: AnyView(InputTagPage())))
    }
}
