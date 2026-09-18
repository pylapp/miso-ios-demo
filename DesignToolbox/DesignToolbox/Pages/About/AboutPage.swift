// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - About Page

// NOTE: Several items below are seen as unused but are used
// This is a false positive in Periphy
// See https://github.com/peripheryapp/periphery/issues/908

struct AboutPage: View {

    // MARK: Properties

    #if os(iOS)
    private let appSettingsUrl: URL
    #endif

    @Environment(\.theme) private var theme
    @Environment(\.openURL) private var openURL

    #if DEBUG
    /// DEBUG-only flag persisting whether the sandbox tab must be displayed.
    /// Toggled by the "Bac à sable" switch item at the bottom of the About page
    /// and observed by ``MainView`` to conditionally insert the Debug tab.
    @AppStorage(SandboxUserDefaultsKeys.sandboxEnabled) private var sandboxEnabled: Bool = false
    #endif

    // MARK: Initializer

    init() {
        #if os(iOS)
        guard let appSettingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            ML.fatal("Unable to find app settings URL")
        }
        self.appSettingsUrl = appSettingsUrl
        #endif
    }

    // MARK: Body

    var body: some View {
        #if os(iOS)
        NavigationView {
            listBody
                .navigationBarTitleDisplayMode(.inline)
                .accentColor(theme.bar.colorAccent)
        }
        .navigationViewStyle(.stack)
        #elseif os(tvOS)
        // tvOS: use `NavigationStack` for consistency with the rest of the app and
        // render the theme / color-scheme controls in a visible focusable header
        // (they cannot be rendered inside a nav bar because tvOS has none).
        NavigationStack {
            VStack(spacing: 0) {
                TVOSTopControlsBar()
                listBody
                    .accentColor(theme.bar.colorAccent)
            }
            .background(theme.colors.bgPrimary)
        }
        #else
        NavigationView {
            listBody
                .accentColor(theme.bar.colorAccent)
        }
        .navigationViewStyle(.automatic)
        #endif
    }

    private var listBody: some View {
        List {
            Section(header: MISOHeading("app_about_versions_title", hasMarker: true)) {
                buildView
            }
            Section(header: MISOHeading("app_about_links_title", hasMarker: true)) {
                linksView
            }
            #if DEBUG
            Section(header: MISOHeading("app_about_debug_title", hasMarker: true)) {
                debugSandboxView
                MISOButton("app_about_debug_clearCache_label", appearance: .negative) {
                    MISOAsyncImageCache.shared.clearCache()
                }
            }
            #endif
        }
        .misoScreenTitle("app_bottomBar_about_label")
    }

    // MARK: - Views

    @ViewBuilder
    private var buildView: some View {

        if Bundle.main.fullBuildType == "stable" {
            OpenableText("app_about_details_appVersion_stable" <- Bundle.main.marketingVersion, anchor: Bundle.main.marketingVersion, type: .githubRelease)
                .modifier(CopyableTextViewModifier(Bundle.main.marketingVersion))
        } else {
            VersionItem(title: "app_about_details_appVersion", version: Bundle.main.marketingVersion)
        }

        VersionItem(title: "app_about_details_buildNumber", version: Bundle.main.buildNumber)

        LiquidGlassStateItem()

        OpenableText("app_about_details_buildType" <- Bundle.main.fullBuildType, anchor: Bundle.main.fullBuildType, type: .githubBuild)
            .modifier(CopyableTextViewModifier(Bundle.main.fullBuildType))

        if let buildDetails = Bundle.main.buildDetails {
            OpenableText("app_about_details_githubBuildDetails" <- buildDetails, anchor: buildDetails, type: .githubIssue)
                .modifier(CopyableTextViewModifier(buildDetails.leadingColumnFragment))
        }

        if let sdkVersion = Bundle.main.sdkVersion, !sdkVersion.isEmpty {
            OpenableText("app_about_details_sdkVersion" <- sdkVersion, anchor: sdkVersion, type: .githubVersion)
                .modifier(CopyableTextViewModifier(sdkVersion))
        }
    }

    @ViewBuilder
    private var linksView: some View {
        if let changelogURL = Bundle.main.changelogURL {
            link(changelogURL, label: "app_about_changelog_label", hint: "app_about_changelog_hint_a11y")
        }

        #if os(iOS)
        Button {
            OSUtilities.open(url: appSettingsUrl)
        } label: {
            HStack {
                MISOLabel("app_about_appSettings_label", size: .large, weight: .strong)
                Spacer()
                Image(systemName: "gear").accessibilityHidden(true)
            }
        }.accessibilityHint("app_about_appSettings_hint_a11y")
        #endif
    }

    @ViewBuilder
    private func link(_ url: URL, label: String, hint: String) -> some View {
        MISOLink(text: label.localized(), indicator: .external, isFullWidth: true) {
            openURL.callAsFunction(url)
        }
        .accessibilityHint(hint.localized())
    }

    #if DEBUG
    // swiftlint:disable accessibility_label_for_image
    /// DEBUG-only switch item displayed at the very bottom of the About list.
    /// Enabling it makes ``MainView`` add a "Debug" tab in first position.
    @ViewBuilder
    private var debugSandboxView: some View {
        MISOSwitchItem("app_about_sandbox_label",
                       isOn: $sandboxEnabled,
                       description: "app_about_sandbox_description".localized(),
                       image: .init(asset: Image(systemName: "hammer")))
    }
    // swiftlint:enable accessibility_label_for_image
    #endif
}

// MARK: - State Item

private struct LiquidGlassStateItem: View {

    @Environment(\.isLiquidGlassDisabled) private var isLiquidGlassDisabled
    @Environment(\.forceMISOLegacyLayout) private var forceMISOLegacyLayout

    private var status: MISOTag.Status {
        if #available(iOS 26, *) {
            if forceMISOLegacyLayout || isLiquidGlassDisabled { return .negative(leading: .none) }
            return .positive(leading: .none)
        } else {
            return .warning(leading: .none)
        }
    }

    private var appearance: MISOTag.Appearance {
        if #available(iOS 26, *) {
            if forceMISOLegacyLayout || isLiquidGlassDisabled { return .emphasized }
            return .muted
        } else {
            return .muted
        }
    }

    private var wording: String {
        if #available(iOS 26, *) {
            if forceMISOLegacyLayout { return "app_common_forced_tech".localized() + " " + "app_common_disabled_tech".localized() }
            if isLiquidGlassDisabled { return "app_common_disabled_tech".localized() }
            return "app_common_enabled_tech".localized()
        } else {
            return "app_common_unavailable_tech".localized()
        }
    }

    var body: some View {
        let versionTag = MISOTag(label: wording,
                                 status: status,
                                 appearance: appearance,
                                 shape: .rounded,
                                 size: .small)

        MISOStaticListItem(data: .init(label: "app_about_isLiquidGlass_disabled".localized()), trailing: .tag(versionTag))
            .misoListItemStyle(divider: false)
            .misoListItemSize(.small)
    }
}

// MARK: - Version Item

private struct VersionItem: View {

    let title: String
    let version: String

    var body: some View {
        let versionTag = MISOTag(label: version,
                                 status: .info(leading: .none),
                                 appearance: .muted,
                                 shape: .rounded,
                                 size: .small)
        MISOStaticListItem(data: .init(label: title.localized()), trailing: .tag(versionTag))
            .misoListItemStyle(divider: false)
            .misoListItemSize(.small)
            .modifier(CopyableTextViewModifier(version))
    }
}
