// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

#if !os(macOS)
import MISOSwiftUI
import SwiftUI

struct ToolBarBottomElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_bottomAppBar_tech"
        illustration = AnyView(ToolBarBottomIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_bottomAppBar_description_text",
            version: MISOVersions.componentToolBarBottomVersion,
            demoScreen: AnyView(ToolBarBottomPage())))
    }
}

private struct ToolBarBottomIllustration: View {

    @Environment(\.theme) var theme
    @Environment(\.isLiquidGlassDisabled) private var isLiquidGlassDisabled

    var body: some View {
        HStack {
            MISOToolBarItem(action: .label("app_components_common_label_label".localized(),
                                           emphasized: true,
                                           accessibilityHint: "",
                                           action: {}))

            Spacer()

            #if !os(visionOS)
            if #available(iOS 26, *), !isLiquidGlassDisabled {
                MISOToolBarItem(action: .icon(asset: Image.defaultImage(prefixedBy: theme.name),
                                              accessibilityLabel: "",
                                              action: {}),
                                style: .prominent)
            } else {
                MISOToolBarItem(action: .icon(asset: Image.defaultImage(prefixedBy: theme.name),
                                              accessibilityLabel: "",
                                              action: {}))
            }
            #endif
        }
        .padding()
        .frame(maxHeight: 80)
        .border(style: theme.borders.styleDefault,
                width: theme.borders.widthDefault,
                radius: theme.borders.radiusDefault,
                color: theme.colors.borderMinimal)
        .background(theme.colors.overlayModalSheet)
    }
}
#endif

#endif
