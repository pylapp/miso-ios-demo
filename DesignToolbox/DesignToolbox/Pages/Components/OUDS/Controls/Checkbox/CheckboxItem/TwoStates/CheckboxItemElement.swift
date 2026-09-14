// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

/// Related to `MISOCheckboxItem` (i.e. with 2 available values).
struct CheckboxItemElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_checkbox_checkboxItem_tech".localized()
        illustration = AnyView(EmptyView())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_checkbox_checkboxItem_description_text",
            version: MISOVersions.componentCheckboxVersion,
            demoScreen: AnyView(CheckboxItemPage())))
    }
}
