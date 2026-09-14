// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI

struct ActionsView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Button", destination: ButtonsView())
            }
        }
    }
}
