// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct HeadingView: View {

    private static let allSizes: [MISOHeading.Size] = [.xLarge, .large, .medium, .small]

    var body: some View {
        WatchScrollLayoutView(title: "Heading", layout: { watchLayout })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            ForEach(Self.allSizes, id: \.self) { size in
                Text("Size \(String(describing: size))").font(.subheadline)
                MISOHeading(text: "Aa", size: size)
            }

            // The marker is only rendered by `MISOHeading` when the theme supports it

            Text("Large with marker").font(.subheadline)
            MISOHeading(text: "Aa", size: .large, hasMarker: true)

            // Only meaningful for `size == .large`; ignored (with a warning) by themes
            // that do not provide a valid `contentBrandSecondary` color
            Text("Colored substring").font(.subheadline)
            MISOHeading(text: "Welcome to MISO", coloredText: "MISO")
        }
    }
}
