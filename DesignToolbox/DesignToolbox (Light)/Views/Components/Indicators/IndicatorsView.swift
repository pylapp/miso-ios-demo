// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI

struct IndicatorsView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Badges", destination: BadgesView())
                NavigationLink("Progress Indicators", destination: ProgressIndicatorsView())
                NavigationLink("Skeletons", destination: SkeletonsView())
                NavigationLink("Tags", destination: TagsView())
            }
        }
    }
}
