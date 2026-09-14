// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Column Gap Property

struct ColumnGapProperty: View {

    var body: some View {
        SpaceTokenProperty(namedTokens: NamedSpace.ColumnGap.allCases) {
            #if !os(tvOS) && !os(watchOS)
            SpaceHeaderDescription(
                firstText: "app_tokens_dimension_space_columnGapHeader_text",
                secondText: "app_tokens_dimension_space_columnGapHeader_text",
                orientation: .horizontal)
            #endif
        } illustration: { token in
            Illustration(token: token)
        }
    }

    struct Illustration: View {
        let token: SpaceSemanticToken
        var body: some View {
            SpaceCommonIllustration(dimension: token, padding: .centerHorizontaly)
        }
    }
}

// MARK: - Row Gap Property

struct RowGapProperty: View {

    var body: some View {
        SpaceTokenProperty(namedTokens: NamedSpace.RowGap.allCases) {
            #if !os(tvOS) && !os(watchOS)
            SpaceHeaderDescription(
                firstText: "app_tokens_dimension_space_rowGapHeader_text",
                secondText: "app_tokens_dimension_space_rowGapHeader_text",
                orientation: .verical)
            #endif
        } illustration: { token in
            Illustration(token: token)
        }
    }

    struct Illustration: View {
        let token: SpaceSemanticToken
        var body: some View {
            SpaceCommonIllustration(dimension: token, padding: .centerVerticaly)
        }
    }
}
