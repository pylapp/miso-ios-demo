// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Navigation List Item Element

struct NavigationListItemElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_listItem_navigation_tech".localized()
        illustration = AnyView(NavigationListItemIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_listItem_navigation_description",
            version: MISOVersions.componentNavigationListItemVersion,
            demoScreen: AnyView(NavigationListItemPage())))
    }
}

// MARK: - Navigation List Item Illustration

struct NavigationListItemIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.fixedSmall) {
            let data = MISOListItemData(label: "Label",
                                        description: "A description of the item to show in the list item view.")
            MISONavigationListItem(data: data, indicatorType: .next)
                .misoListItemStyle(divider: false, background: false)
        }
    }
}
