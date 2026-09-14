// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct InlineAlertElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_alert_inlineAlert_tech".localized()
        illustration = AnyView(AlertIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_alert_inlineAlert_description_text",
            version: MISOVersions.componentInlineAlertVersion,
            demoScreen: AnyView(InlineAlertPage())))
    }
}
