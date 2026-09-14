// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct SwitchesView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Switch", destination: SwitchesOnlyView())
                NavigationLink("Switch Item", destination: SwitchesItemView())
            }
        }
        .navigationTitle("Switches")
    }
}
