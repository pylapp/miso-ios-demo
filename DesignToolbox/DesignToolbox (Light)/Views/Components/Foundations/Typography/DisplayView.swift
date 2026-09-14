// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct DisplayView: View {

    private static let allSizes: [MISODisplay.Size] = [.large, .medium, .small]

    var body: some View {
        WatchScrollLayoutView(title: "Display", layout: { watchLayout })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            ForEach(Self.allSizes, id: \.self) { size in
                Text("Size \(String(describing: size))").font(.subheadline)
                MISODisplay(text: "Aa", size: size)
            }
        }
    }
}
