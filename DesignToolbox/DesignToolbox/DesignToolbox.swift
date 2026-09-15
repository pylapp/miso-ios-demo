// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - App

@main
struct DesignToolbox: App {

    init() {
        ML.verbose = true
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

// MARK: - Content View

struct ContentView: View {

    @AppStorage("info.pylapp.misso.demoAPp.colorSchemeMode") private var mode: String = ColorSchemeMode.auto.rawValue
    @StateObject private var themeProvider = ThemeProvider()

    #if os(macOS)
    @StateObject private var windowManager = WindowManager()
    #endif

    private var colorScheme: ColorScheme? {
        if mode == ColorSchemeMode.light.rawValue {
            return .light
        }
        if mode == ColorSchemeMode.dark.rawValue {
            return .dark
        }
        return nil
    }

    var body: some View {
        MISOThemeableView(theme: themeProvider.currentTheme) {
            MainView().environmentObject(themeProvider)
        }
        .preferredColorScheme(colorScheme)
        #if os(macOS)
            .environmentObject(windowManager)
        #endif
    }
}
