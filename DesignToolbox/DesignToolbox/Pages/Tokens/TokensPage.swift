// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI

struct TokensPage: View {

    @Environment(\.theme) private var theme

    var body: some View {
        DesignToolboxElementsPage(title: "app_bottomBar_tokens_label",
                                  elements: AllElements.tokenElements(themeName: theme.name).sorted(by: { $0.name < $1.name }))
    }
}
