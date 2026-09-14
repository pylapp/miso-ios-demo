// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct ComponentsView: View {

    @ViewBuilder
    var body: some View {
        NavigationLink("Actions", destination: ActionsView())
        NavigationLink("Content Display", destination: ContentDisplayView())
        NavigationLink("Controls", destination: ControlsView())
        NavigationLink("Dialogs", destination: DialogsView())
        NavigationLink("Foundations", destination: FoundationsView())
        NavigationLink("Indicators", destination: IndicatorsView())
        NavigationLink("Layouts", destination: LayoutsView())
        NavigationLink("Navigations", destination: NavigationsView())
    }
}
