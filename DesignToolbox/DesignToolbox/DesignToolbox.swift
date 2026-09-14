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

    #if os(iOS)
    @StateObject private var appStoreUpdateViewModel = AppStoreUpdateViewModel()
    #endif

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
        #if os(iOS)
            .alert(appStoreUpdateViewModel.alertTitle,
                   isPresented: $appStoreUpdateViewModel.showUpdateAlert)
            {
                Button(role: .cancel) {
                    // Dismiss — the alert will reappear on next launch if the update is still pending.
                } label: {
                    Text("app_update_alert_button_dismiss")
                }
                if let url = appStoreUpdateViewModel.appStoreURL {
                    Button {
                        OSUtilities.open(url: url)
                    } label: {
                        Text("app_update_alert_button_store")
                    }
                }
            } message: {
                Text(appStoreUpdateViewModel.alertMessage)
            }
        #endif
        #if os(macOS)
        .environmentObject(windowManager)
        #endif
    }
}
