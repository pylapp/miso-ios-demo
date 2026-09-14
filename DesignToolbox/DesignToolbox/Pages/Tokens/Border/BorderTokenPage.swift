// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct BorderTokenPage: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            Section {
                VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                    DesignToolboxCode(code: "theme.borders.widthDefault", titleText: "app_tokens_common_viewCodeExample_label")
                }
            }

            Section {
                VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                    ForEach(NamedBorderWidth.allCases, id: \.rawValue) { namedWidth in
                        IllustrationWidth(namedWidth: namedWidth)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            } header: {
                MISOHeading("app_tokens_border_width_tech", size: .large, hasMarker: true)
                    .foregroundStyle(theme.colors.contentDefault)
            }

            Section {
                VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                    ForEach(NamedBorderRadius.allCases, id: \.rawValue) { namedRadius in
                        IllustrationRadius(namedRadius: namedRadius)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            } header: {
                MISOHeading("app_tokens_border_radius_tech", size: .large, hasMarker: true)
                    .foregroundStyle(theme.colors.contentDefault)
            }

            Section {
                VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                    ForEach(NamedBorderStyle.allCases, id: \.rawValue) { namedStyle in
                        IllustrationStyle(namedStyle: namedStyle)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            } header: {
                MISOHeading("app_tokens_border_style_tech", size: .large, hasMarker: true)
                    .foregroundStyle(theme.colors.contentDefault)
            }
        }
        .gridMargin(.horizontal)
    }
}
