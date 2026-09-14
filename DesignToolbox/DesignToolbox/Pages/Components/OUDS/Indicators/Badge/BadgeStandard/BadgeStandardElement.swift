// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct BadgeStandardElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_badge_standard_tech".localized()
        illustration = AnyView(BadgeIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_badge_standard_description_text",
            version: MISOVersions.componentBadgeVersion,
            demoScreen: AnyView(BadgeStandardPage())))
    }
}
