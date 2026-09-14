// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import MISOTokensSemantic
import SwiftUI

// MARK: Toolbar Bottom Page

#if !os(iOS)
struct ToolBarBottomPage: View {
    var body: some View {
        Text("app_common_soonAvailable")
    }
}
#else
struct ToolBarBottomPage: View {

    @StateObject private var configurationModel: ToolBarBottomConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: ToolBarBottomConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            ToolBarBottomDemo(configurationModel: configurationModel)
        } configurationView: {
            ToolBarBottomConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Toolbar Bottom Demo

private struct ToolBarBottomDemo: View {

    @ObservedObject var configurationModel: ToolBarBottomConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        MISOButton("app_components_toolbar_demo_showDemo_label", appearance: .strong) {
            configurationModel.showDemo = true
        }
        .disabled(configurationModel.leading == .none && configurationModel.trailing == .none)
        .sheet(isPresented: $configurationModel.showDemo) {
            MISONavigationStack(content: demo)
        }
    }

    @ViewBuilder
    private func demo() -> some View {
        ToolBarCommonContentView()
            .modifier(BottomBarModifier(configurationModel: configurationModel))
            .background(theme.colors.overlayModalSheet)
            .toolBarTop("Demo") {
                MISOToolBarItem(navigation: .close)
            }
    }
}

// MARK: - Bottom Bar Modifier

private struct BottomBarModifier: ViewModifier {

    @ObservedObject var configurationModel: ToolBarBottomConfigurationModel
    @Environment(\.theme) private var theme

    func body(content: Content) -> some View {
        if configurationModel.groupedItems {
            content.toolBarBottom(groupedItems: {
                configurationModel.leadingItems(for: theme)
            })
        } else {
            content
                .toolBarBottom {
                    configurationModel.leadingItems(for: theme)
                } trailingItems: {
                    configurationModel.trailingItems()
                }
        }
    }
}
#endif

#endif
