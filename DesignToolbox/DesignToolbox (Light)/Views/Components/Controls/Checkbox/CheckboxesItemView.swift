// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct CheckboxesItemView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Two-states", destination: TwoStatesCheckboxesItemsView())
                NavigationLink("Three-states", destination: ThreeStatesCheckboxesItemsView())
            }
        }
    }
}
