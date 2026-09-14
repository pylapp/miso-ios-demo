// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable accessibility_label_for_image

struct LinksView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Link",
                              layout: { watchOSVerticalLayout })
    }

    // MARK: - watchOS

    private var watchOSVerticalLayout: some View {
        WatchVerticalLayout {
            Text("Size default").font(.headline)

            Text("Enabled").font(.subheadline)
            MISOLink(text: "Link", size: .default) {}
            MISOLink(text: "Link", image: MISOImage(asset: Image(systemName: "sun.min.fill")), size: .default) {}
            MISOLink(text: "Link", indicator: .previous, size: .default) {}
            MISOLink(text: "Link", indicator: .next, size: .default) {}
            MISOLink(text: "Link", indicator: .external, size: .default) {}

            Text("Disabled").font(.subheadline)
            MISOLink(text: "Link", size: .small) {}.disabled(true)
            MISOLink(text: "Link", image: MISOImage(asset: Image(systemName: "sun.min.fill")), size: .small) {}.disabled(true)
            MISOLink(text: "Link", indicator: .previous, size: .default) {}.disabled(true)
            MISOLink(text: "Link", indicator: .next, size: .default) {}.disabled(true)
            MISOLink(text: "Link", indicator: .external, size: .default) {}.disabled(true)

            Text("Size small").font(.headline)

            Text("Enabled").font(.subheadline)
            MISOLink(text: "Link", size: .small) {}
            MISOLink(text: "Link", image: MISOImage(asset: Image(systemName: "sun.min.fill")), size: .small) {}
            MISOLink(text: "Link", indicator: .previous, size: .small) {}
            MISOLink(text: "Link", indicator: .next, size: .small) {}
            MISOLink(text: "Link", indicator: .external, size: .small) {}

            Text("Disabled").font(.subheadline)
            MISOLink(text: "Link", size: .small) {}.disabled(true)
            MISOLink(text: "Link", image: MISOImage(asset: Image(systemName: "sun.min.fill")), size: .small) {}.disabled(true)
            MISOLink(text: "Link", indicator: .previous, size: .small) {}.disabled(true)
            MISOLink(text: "Link", indicator: .next, size: .small) {}.disabled(true)
            MISOLink(text: "Link", indicator: .external, size: .small) {}.disabled(true)
        }
    }

    @ViewBuilder
    private func linkSection(title: String, @ViewBuilder content: () -> some View) -> some View {
        VStack(spacing: theme.spaces.paddingBlockMedium) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            VStack(spacing: theme.spaces.paddingBlockXsmall) {
                content()
            }
        }
        .padding()
    }
}

// swiftlint:enable accessibility_label_for_image
