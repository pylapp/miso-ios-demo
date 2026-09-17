// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Extensions of MISOTheme

/// Extension of the `MISOTheme` to add both `Identifiable` and `Hashable`.
/// An `MISOTheme` must be `Identifiable` to be enumerated like in `ForEach`(e.g. used to build the list of elements in picker).
/// It must be `Hashable` because it is used in a picker than need `Hashable` element.
extension MISOTheme: @retroactive Identifiable, @retroactive Hashable {

    /// The text displayed in submenus of the theme selector
    var description: String {
        if self is FoxyRoughTheme {
            return FoxyRoughTheme.themeName
        }
        if self is BlueCoatTheme {
            return BlueCoatTheme.name
        }
        return "Default"
    }

    // MARK: Identifiable

    /// The unique identifier to store the selected theme
    public var id: String {
        if self is FoxyRoughTheme {
            return FoxyRoughTheme.themeName
        }

        if self is BlueCoatTheme {
            return BlueCoatTheme.name
        }
        return String(describing: Self.self)
    }

    // MARK: Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Theme Provider

/// Theme provider that proposes all supported themes for the demo application.
/// It also stores the current theme, selected by user.
@MainActor final class ThemeProvider: ObservableObject {

    let allThemes: [MISOTheme]

    var hotSwitchWarning: HotSwitchWarning

    @UserDefaultsWrapper(key: "info.pylapp.miso.demoapp.theme", defaultValue: BlueCoatTheme.name)
    private static var currentTheme

    @Published var currentTheme: MISOTheme {
        didSet {
            ThemeProvider.currentTheme = currentTheme.id
            if currentTheme != oldValue {
                hotSwitchWarning.showAlert = true
            }
        }
    }

    init() {

        // Init all themes
        let blueCoatTheme = BlueCoatTheme()
        let foxyRoughTheme = FoxyRoughTheme()

        let defaultTheme = blueCoatTheme

        // Fill arrays for menus
        allThemes = [blueCoatTheme, foxyRoughTheme]

        if let theme = allThemes.first(where: { $0.id == ThemeProvider.currentTheme }) {
            currentTheme = theme
        } else {
            currentTheme = defaultTheme
        }

        hotSwitchWarning = HotSwitchWarning()
    }

    deinit {}
}

// MARK: - Theme Selection Button

/// Button to make the user change the current theme.
struct ThemeSelectionButton: View {

    @EnvironmentObject private var themeProvider: ThemeProvider

    #if os(tvOS)
    // On tvOS `Menu` requires tvOS 17+ and behaves poorly with nested pickers.
    // We open a full-screen sheet listing all themes grouped by family instead;
    // this stays compatible with tvOS 16.6 and offers a proper focusable list.
    @State private var showThemePicker: Bool = false
    #endif

    var body: some View {
        #if os(tvOS)
        Button {
            showThemePicker = true
        } label: {
            Image(decorative: "ic_theme")
                .scaledToFit()
        }
        .modifier(HotSwitchWarningModifier(hotSwitchWarningIndicator: themeProvider.hotSwitchWarning))
        .accessibilityLabel("app_topBar_theme_button_a11y")
        .accessibilityHint("app_topBar_theme_button_hint_a11y")
        .fullScreenCover(isPresented: $showThemePicker) {
            TVOSThemePickerSheet(isPresented: $showThemePicker)
                .environmentObject(themeProvider)
        }
        #else
        menuBody
        #endif
    }

    #if !os(tvOS)
    private var menuBody: some View {
        Menu {
            #if !os(macOS) && !os(tvOS)
            // Sosh and BlueCoat themes (which do not have tunings)
            Picker(selection: $themeProvider.currentTheme, label: EmptyView()) {
                ForEach(themeProvider.allThemes, id: \.id) { theme in
                    Text(theme.description).tag(theme)
                    Divider()
                }
            }
            .pickerStyle(.automatic)
            #else
            Divider() // with macOS/tvOS at least there are troubles with menus and pickers inside
            ForEach(themeProvider.allThemes, id: \.id) { theme in
                Button(theme.description) {
                    themeProvider.currentTheme = theme
                }
            }
            #endif
        } label: {
            Image(decorative: "ic_theme")
                .scaledToFit()
        }
        .modifier(HotSwitchWarningModifier(hotSwitchWarningIndicator: themeProvider.hotSwitchWarning))
        .accessibilityLabel("app_topBar_theme_button_a11y")
        .accessibilityHint("app_topBar_theme_button_hint_a11y")
    }
    #endif
}

// MARK: - Hot Switch

final class HotSwitchWarning: ObservableObject {

    @Published var showAlert: Bool = false

    deinit {}
}

/// `ViewModifier` displaying an alert (if set in app settings) notifying the user if it wants to restart the app
/// if the theme changed. If so, kills the app. If not, let iy as is.
/// Thus if the app is killed or if the user restarts it, we won't be in unstable cases like the one explained in issue 850:
/// a situation where an unexisting token is used but with the bad theme.
///
/// See https://github.com/Orange-OpenSource/ouds-ios/issues/850
struct HotSwitchWarningModifier: ViewModifier {

    @ObservedObject var hotSwitchWarningIndicator: HotSwitchWarning

    @UserDefaultsWrapper(key: "info.pylapp.miso.demoapp.askToRestartIfThemeChanged", defaultValue: false) // Defined in Settings.bundle
    private var askToRestart: Bool

    @ViewBuilder
    func body(content: Content) -> some View {
        if askToRestart {
            content
                .alert(isPresented: $hotSwitchWarningIndicator.showAlert) {
                    Alert(
                        title: Text("app_settings_themeSwitch_title"),
                        message: Text("app_settings_themeSwitch_description"),
                        primaryButton: .destructive(Text("app_settings_themeSwitch_restart")) {
                            exit(0) // ( ˶°ㅁ°) !! BOOM
                        },
                        secondaryButton: .cancel(Text("app_settings_themeSwitch_cancel")))
                }
        } else {
            content
        }
    }
}

// MARK: - tvOS Theme Picker Sheet

#if os(tvOS)

/// Full-screen sheet used on tvOS to pick a theme.
///
/// SwiftUI's `Menu` API requires tvOS 17+ and behaves poorly with nested
/// pickers, so on tvOS the theme selection is presented as a `List` grouped by
/// theme family (Orange / Orange Compact / Other). Each row is a focusable
/// button and the currently active theme is marked with a checkmark.
private struct TVOSThemePickerSheet: View {

    @Binding var isPresented: Bool

    @EnvironmentObject private var themeProvider: ThemeProvider
    @Environment(\.theme) private var theme

    var body: some View {
        NavigationStack {
            ZStack {
                // Opaque background so the sheet fully masks the page underneath.
                // Without this, tvOS renders the sheet with a translucent List and
                // the underlying content bleeds through, making the picker unreadable.
                Rectangle()
                    .fill(theme.colors.bgPrimary)
                    .ignoresSafeArea()

                List {
                    themeSection(title: "app_topBar_theme_picker_otherThemes_section".localized(),
                                 themes: themeProvider.allThemes)
                }
                // Note: `.scrollContentBackground(.hidden)` is unavailable on tvOS.
                // The opaque `Rectangle` behind the `List` is what actually masks
                // the page below the sheet; the `List` itself sits on top with its
                // default (potentially translucent) chrome.
            }
            .navigationTitle("app_topBar_theme_picker_navigationTitle")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        isPresented = false
                    } label: {
                        Text("app_topBar_theme_picker_close_label")
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func themeSection(title: String, themes: [MISOTheme]) -> some View {
        Section(title) {
            ForEach(themes, id: \.id) { candidate in
                themeRow(for: candidate)
            }
        }
    }

    @ViewBuilder
    private func themeRow(for candidate: MISOTheme) -> some View {
        let isSelected = candidate.id == themeProvider.currentTheme.id
        Button {
            themeProvider.currentTheme = candidate
            isPresented = false
        } label: {
            HStack {
                Text(candidate.description)
                    .foregroundStyle(theme.colors.contentDefault)
                Spacer()
                if isSelected {
                    // `.circle.fill` version stays visible whatever the theme background.
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(theme.colors.contentBrandPrimary)
                        .accessibilityLabel("app_topBar_theme_picker_selected_a11y")
                }
            }
        }
    }
}

#endif
