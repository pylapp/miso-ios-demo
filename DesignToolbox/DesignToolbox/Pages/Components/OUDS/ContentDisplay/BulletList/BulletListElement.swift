// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Bullet List Element

struct BulletListElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_bulletList_tech".localized()
        illustration = AnyView(BulletListIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_bulletList_description_text",
            version: MISOVersions.componentBulletListVersion,
            demoScreen: AnyView(BulletListPage())))
    }
}

// MARK: - Bullet List Illustration

private struct BulletListIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .center, spacing: theme.spaces.fixedNone) {
            MISOBulletList {
                MISOBulletList.Item(LocalizedStringKey("app_components_common_label_label"))
                MISOBulletList.Item(LocalizedStringKey("app_components_common_label_label"))
            }
        }
        .padding(.leading, 120)
    }
}
