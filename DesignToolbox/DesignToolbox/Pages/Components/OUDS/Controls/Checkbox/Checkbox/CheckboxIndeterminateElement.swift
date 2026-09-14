// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

/// Related to `MISOCheckboxIndeterminate` (i.e. with 3 available values).
struct CheckboxIndeterminateElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_checkbox_indeterminateCheckbox_tech".localized()
        illustration = AnyView(EmptyView())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_checkbox_indeterminateCheckbox_description_text",
            version: MISOVersions.componentCheckboxVersion,
            demoScreen: AnyView(CheckboxIndeterminatePage())))
    }
}
