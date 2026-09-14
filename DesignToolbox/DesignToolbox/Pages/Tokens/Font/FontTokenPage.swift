// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Font Token Page

struct FontTokenPage: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            Section {
                DesignToolboxCode(code: "theme.bodyStrongLarge(theme)", titleText: "app_tokens_common_viewCodeExample_label")
            }
            Spacer()

            ForEach(NamedFont.allCases, id: \.rawValue) { fontName in
                IllustrationFont(namedFont: fontName)
            }
        }
        .gridMargin(.horizontal)
        .navigationTitle(LocalizedStringKey("app_tokens_typography_tech"))
    }
}
