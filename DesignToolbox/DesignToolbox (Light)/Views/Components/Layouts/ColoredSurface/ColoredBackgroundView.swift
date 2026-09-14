// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct ColoredBackgroundView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Surfaces",
                              layout: { WatchVerticalLayout { layout } })
    }

    private var layout: some View {
        VStack(spacing: theme.spaces.scaledXsmallMobile) {
            ForEach(NamedColorMode.allCases, id: \.self) { color in
                let themedColor = color.toSurfaceColor(from: theme)
                if !themedColor.hasUndefinedValue() {
                    Text(String(describing: color)).font(.headline)
                    MISOColoredSurface(color: themedColor) {
                        ColoredSurfaceItems()
                    }.focusable()
                }
            }
        }
    }
}

private struct ColoredSurfaceItems: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .center, spacing: theme.spaces.scaledSmallMobile) {
            Text("Text").foregroundColor(theme.colors.contentDefault)
            MISOButton(text: "Button", appearance: .default, style: .default) {}
            MISOLink(text: "Link", indicator: .next) {}
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}
