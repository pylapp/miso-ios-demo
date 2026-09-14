// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

/// Using Swift files from DesignToolbox folder, displays simply the borders tokens
struct BordersView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Borders",
                              layout: { watchLayout })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            Text("Width").font(.headline)
            ForEach(NamedBorderWidth.allCases, id: \.rawValue) { namedWidth in
                IllustrationWidth(namedWidth: namedWidth)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Text("Radius").font(.headline)
            ForEach(NamedBorderRadius.allCases, id: \.rawValue) { namedRadius in
                IllustrationRadius(namedRadius: namedRadius)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            Text("Styles").font(.headline)
            ForEach(NamedBorderStyle.allCases, id: \.rawValue) { namedStyle in
                IllustrationStyle(namedStyle: namedStyle)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
