// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

/// `App` dedicated to watchOS with very simple UI.
/// Displays groups of components without customziation panes, only for debug purposes and quickchecks.
/// Uses a simple UI, overall becayse current Design System Toolbox is desgined for iOS first.
@main struct DesignToolbox_Light_App: App {

    @State private var selectedThemeIndex: Int = 0

    private let themes: [MISOTheme] = [
        BlueCoatTheme(),
    ]

    var body: some Scene {
        WindowGroup {
            TabView(selection: $selectedThemeIndex) {
                ForEach(themes.indices, id: \.self) { index in
                    MISOThemeableView(theme: themes[index]) {
                        NavigationView {
                            List {
                                Section("Tokens") {
                                    TokensView()
                                }
                                Section("Components") {
                                    ComponentsView()
                                }
                            }
                            .navigationTitle(themes[index].name)
                        }
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle()) // Let user swipe to change theme and compare
        }
    }
}
