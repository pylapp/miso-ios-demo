// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct ListItemElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            StaticListItemElement(),
            NavigationListItemElement(),
        ]
        name = "app_components_listItem_tech".localized()
        illustration = AnyView(ListItemIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_listItem_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

struct ListItemIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.fixedSmall) {
            let data = MISOListItemData(key: "app_components_common_label_label",
                                        description: "app_components_listItemHelperText_label".localized())
            MISOStaticListItem(data: data)
                .misoListItemStyle(divider: false, background: true)
        }
    }
}
