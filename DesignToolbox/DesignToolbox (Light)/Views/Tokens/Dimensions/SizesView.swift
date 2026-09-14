// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

/// Using Swift files from DesignToolbox folder, displays simply the sizes tokens
struct SizesView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(layout: { WatchVerticalLayout { watchLayout } })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            Text("Decorative").font(.headline)
            VStack(alignment: .center, spacing: theme.spaces.fixedNone) {
                ForEach(NamedSize.IconDecorative.allCases, id: \.rawValue) { namedSize in
                    IllustrationIconDecorative(namedSize: namedSize)
                }
            }
            Text("Typography").font(.headline)
            VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                ForEach(NamedSize.iconSizeByTypographyCategories, id: \.namedFont) { category in
                    IllustrationSizeIconByTypographyCategory(category: category)
                }
            }
        }
    }
}
