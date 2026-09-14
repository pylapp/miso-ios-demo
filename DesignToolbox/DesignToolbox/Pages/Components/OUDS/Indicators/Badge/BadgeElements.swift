// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct BadgeElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            BadgeStandardElement(),
            BadgeCountElement(),
            BadgeIconElement(),
        ]

        name = "app_components_badge_tech".localized()
        illustration = AnyView(BadgeIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_badge_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

struct BadgeIllustration: View {

    var body: some View {
        MISOBadgeCount(1, accessibilityLabel: "", status: .negative, size: .medium)
    }
}
