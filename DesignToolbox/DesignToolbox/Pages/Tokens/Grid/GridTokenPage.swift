// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct GridTokenPage: View {

    @Environment(\.theme) private var theme
    @Environment(\.misoHorizontalSizeClass) private var horizontalSizeClass

    // MARK: Body

    var body: some View {
        Group {
            VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                Image(decorative: "il_tokens_grid_column_margin")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(theme.colors.surfaceSecondary)
                Image(decorative: "il_tokens_grid_min_width")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(theme.colors.surfaceSecondary)
                Image(decorative: "il_tokens_grid_max_width")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(theme.colors.surfaceSecondary)
            }

            Section {
                DesignToolboxCode(code: "theme.gridColumnCount(for: horizontalSizeClass)", titleText: "app_tokens_common_viewCodeExample_label")
            }

            Section { illustrationForGridTokens() } header: {
                MISOHeading(text: horizontalSizeClass.rawValue, size: .medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .gridMargin(.horizontal)
    }

    // MARK: Private helpers

    private func illustrationForGridTokens() -> some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(NamedGrid.allCases, id: \.rawValue) { namedGrid in
                illustration(for: namedGrid)
            }
        }
    }

    private func illustration(for namedGrid: NamedGrid) -> some View {
        let token = namedGrid.token(from: theme, for: horizontalSizeClass)
        let name = namedGrid.rawValue
        let value = String(format: "%.2f pt", token)

        return DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
            EmptyView()
        }
    }
}
