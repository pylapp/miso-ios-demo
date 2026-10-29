// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct SkeletonsView: View {

    var body: some View {
        WatchScrollLayoutView(title: "Skeletons",
                              layout: { WatchVerticalLayout { watchOSLayout } })
    }

    @ViewBuilder
    private var watchOSLayout: some View {
        Group {
            VStack {
                Text("Circle").font(.headline)
                MISOSkeleton(shape: Circle())
                    .frame(width: 100, height: 30)

                Text("Rectangle").font(.headline)
                MISOSkeleton(shape: Rectangle())
                    .frame(width: 100, height: 30)

                Text("Rounded Rectangle").font(.headline)
                MISOSkeleton(shape: RoundedRectangle(cornerRadius: 25.0))
                    .frame(width: 100, height: 30)
            }
        }.showSkeleton(isVisible: true, isAnimated: true)
    }
}
