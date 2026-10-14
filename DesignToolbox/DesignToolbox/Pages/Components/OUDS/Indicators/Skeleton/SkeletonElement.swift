// Software: MISO iOS (demo app) (fork of MISO iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct SkeletonElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_skeleton_tech".localized()
        illustration = AnyView(SkeletonDemo(configurationModel: .init()))
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_skeleton_description_text",
            version: MISOVersions.componentSkeletonVersion,
            demoScreen: AnyView(SkeletonPage())))
    }
}
