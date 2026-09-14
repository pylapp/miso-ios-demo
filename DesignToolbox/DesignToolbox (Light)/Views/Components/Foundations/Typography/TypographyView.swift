// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI

struct TypographyView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Display", destination: DisplayView())
                NavigationLink("Heading", destination: HeadingView())
                NavigationLink("Body", destination: BodyView())
                NavigationLink("Label", destination: LabelView())
                NavigationLink("Code", destination: CodeView())
            }
        }
    }
}
