// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct CheckboxesView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Checkbox", destination: CheckboxesOnlyView())
                NavigationLink("Checkbox Item", destination: CheckboxesItemView())
            }
        }
        .navigationTitle("Checkboxes")
    }
}
