// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct AlertElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            AlertMessageElement(),
            InlineAlertElement(),
        ]

        name = "app_components_alert_tech".localized()
        illustration = AnyView(AlertIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_alert_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

struct AlertIllustration: View {

    var body: some View {
        MISOAlertMessage("app_components_common_label_label")
    }
}
