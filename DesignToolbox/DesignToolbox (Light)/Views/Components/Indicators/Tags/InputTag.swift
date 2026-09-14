// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct InputTagView: View {

    var body: some View {
        WatchScrollLayoutView(layout: { WatchVerticalLayout { layout } })
    }

    @ViewBuilder
    private var layout: some View {
        Text("Enabled").font(.headline)
        MISOInputTag(label: "Input") {}
        Text("Disabled").font(.headline)
        MISOInputTag(label: "Input") {}.disabled(true)
    }
}
