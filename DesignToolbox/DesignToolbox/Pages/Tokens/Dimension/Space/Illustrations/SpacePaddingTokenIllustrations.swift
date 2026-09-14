// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Padding Inline property

struct PaddingInlineProperty: View {

    var body: some View {
        SpaceTokenProperty(namedTokens: NamedSpace.PaddingInline.allCases) {
            #if !os(tvOS) && !os(watchOS)
            SpaceHeaderDescription(text: "app_tokens_dimension_space_paddingInlineHeader_text", paddings: EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
            #endif
        } illustration: { token in
            Illustration(token: token)
        }
    }

    struct Illustration: View {
        let token: SpaceSemanticToken
        var body: some View {
            SpaceCommonIllustration(dimension: token, padding: .leading(nil))
        }
    }
}

// MARK: - Padding Block property

struct PaddingBlockProperty: View {

    var body: some View {
        SpaceTokenProperty(namedTokens: NamedSpace.PaddingBlock.allCases) {
            #if !os(tvOS) && !os(watchOS)
            SpaceHeaderDescription(text: "app_tokens_dimension_space_paddingBlockHeader_text", paddings: EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            #endif
        } illustration: { token in
            Illustration(token: token)
        }
    }

    struct Illustration: View {
        let token: SpaceSemanticToken
        var body: some View {
            SpaceCommonIllustration(dimension: token, padding: .top(nil))
        }
    }
}
