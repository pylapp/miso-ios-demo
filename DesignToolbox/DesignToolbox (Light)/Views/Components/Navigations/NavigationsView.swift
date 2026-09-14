// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI

struct NavigationsView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Link", destination: LinksView())
                NavigationLink("Static List Item", destination: StaticListItemView())
                NavigationLink("Navigation List Item", destination: NavigationListItemView())
            }
        }
    }
}
