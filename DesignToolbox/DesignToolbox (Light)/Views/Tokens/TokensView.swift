// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct TokensView: View {

    @ViewBuilder
    var body: some View {
        NavigationLink("Borders", destination: BordersView())
        NavigationLink("Colors", destination: ColorsView())
        NavigationLink("Dimensions", destination: DimensionsView())
        NavigationLink("Elevations", destination: ElevationsView())
        NavigationLink("Fonts", destination: FontsView())
        NavigationLink("Grids", destination: GridsView())
        NavigationLink("Opacities", destination: OpacitiesView())
    }
}
