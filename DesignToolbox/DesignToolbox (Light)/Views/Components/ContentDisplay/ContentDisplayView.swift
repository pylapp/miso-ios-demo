// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI

struct ContentDisplayView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Bullet List", destination: BulletListsView())
            }
        }
    }
}
