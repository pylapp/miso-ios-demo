// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct DimensionsView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Sizes", destination: SizesView())
                NavigationLink("Spaces", destination: SpacesView())
            }
        }
        .navigationTitle("Dimensions")
    }
}
