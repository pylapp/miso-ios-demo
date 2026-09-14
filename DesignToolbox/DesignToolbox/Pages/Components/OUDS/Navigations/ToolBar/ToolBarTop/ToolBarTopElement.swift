// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

// MARK: - Toolbar Top Element

struct ToolBarTopElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_topAppBar_tech"
        illustration = AnyView(ToolBarTopIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_topAppBar_description_text",
            version: MISOVersions.componentToolBarTopVersion,
            demoScreen: AnyView(ToolBarTopPage())))
    }
}

// MARK: - Toolbar Top Illustration

private struct ToolBarTopIllustration: View {

    @Environment(\.theme) var theme

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {}
                .toolBarTop("app_components_common_label_label".localized()) {
                    MISOToolBarItem(navigation: .back())
                } trailingItems: {
                    MISOToolBarItem(action: .icon(asset: Image.defaultImage(prefixedBy: theme.name), accessibilityLabel: "", action: {}))
                }
        }
        .frame(maxHeight: 80)
    }
}

#endif
