// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct FoundationsView: View {

    @ViewBuilder
    var body: some View {
        NavigationLink("Typography", destination: TypographyView())
    }
}
