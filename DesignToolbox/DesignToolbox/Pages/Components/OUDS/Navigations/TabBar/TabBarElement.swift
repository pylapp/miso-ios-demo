// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

struct TabBarElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_tabBar_tech".localized()
        illustration = AnyView(TabBarIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_tabBar_description_text",
            version: MISOVersions.componentTabBarVersion,
            demoScreen: AnyView(TabBarPage())))
    }
}

struct TabBarIllustration: View {

    var body: some View {
        MISOTabBar(selectedTab: .constant(0), count: 3) {
            let wording = "app_components_common_label_label".localized()
            FakeTabItem(title: wording, imageName: "heart-empty", tag: 0)
            FakeTabItem(title: wording, imageName: "heart-empty", tag: 1)
            FakeTabItem(title: wording, imageName: "heart-empty", tag: 2)
        }
        .frame(maxHeight: 100)
    }

    private struct FakeTabItem: View {
        let title: String
        let imageName: String
        let tag: Int

        @Environment(\.theme) private var theme

        var body: some View {
            Text("")
                .tabItem {
                    Label {
                        Text(title)
                    } icon: {
                        Image.decorativeImage(named: imageName, prefixedBy: theme.name)
                            .renderingMode(.template)
                    }
                }
                .tag(tag)
        }
    }
}

#endif
