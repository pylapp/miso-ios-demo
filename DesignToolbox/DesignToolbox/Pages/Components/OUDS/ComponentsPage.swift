// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI

struct ComponentsPage: View {

    var body: some View {
        DesignToolboxElementsPage(title: "app_bottomBar_components_label",
                                  elements: AllElements.componentElements().sorted(by: { $0.name < $1.name }))
    }
}
