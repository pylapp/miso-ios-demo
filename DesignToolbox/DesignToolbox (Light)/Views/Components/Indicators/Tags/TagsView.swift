// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct TagsView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Tag", destination: TagView())
                NavigationLink("Input tag", destination: InputTagView())
            }
        }
        .navigationTitle("Tags")
    }
}
