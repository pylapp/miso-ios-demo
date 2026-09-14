// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI

/// Displays the given layout in a `ScrollView`
struct WatchScrollLayoutView<WatchLayout: View>: View {

    let title: String?
    let layout: WatchLayout

    init(title: String? = nil,
         @ViewBuilder layout: () -> WatchLayout)
    {
        self.title = title
        self.layout = layout()
    }

    var body: some View {
        if let title {
            ScrollView {
                layout
            }
            .navigationTitle(title)
        } else {
            ScrollView {
                layout
            }
        }
    }
}
