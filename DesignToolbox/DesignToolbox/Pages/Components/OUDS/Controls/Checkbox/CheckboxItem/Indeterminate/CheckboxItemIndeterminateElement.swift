// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

/// Related to `MISOCheckboxItemIndeterminate` (i.e. with 3 available values).
struct CheckboxItemIndeterminateElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_checkbox_indeterminateCheckboxItem_tech".localized()
        illustration = AnyView(EmptyView())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_checkbox_indeterminateCheckboxItem_description_text",
            version: MISOVersions.componentCheckboxVersion,
            demoScreen: AnyView(CheckboxItemIndeterminatePage())))
    }
}
