// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Size Token Page

struct SizeTokenPage: View {

    @Environment(\.theme) private var theme

    var body: some View {
        Group {
            Section {
                DesignToolboxCode(code: "theme.iconWithHeadingXLargeSm.dimension(for: horizontalSizeClass ?? .regular)",
                                  titleText: "app_tokens_common_viewCodeExample_label")
            }

            Section {
                VStack(alignment: .center, spacing: theme.spaces.fixedNone) {
                    ForEach(NamedSize.IconDecorative.allCases, id: \.rawValue) { namedSize in
                        IllustrationIconDecorative(namedSize: namedSize)
                    }
                }
            } header: {
                sectionHeader("app_tokens_dimension_size_iconDecorative_tech")
            }

            Section {
                VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                    ForEach(NamedSize.iconSizeByTypographyCategories, id: \.namedFont) { category in
                        IllustrationSizeIconByTypographyCategory(category: category)
                    }
                }
            } header: {
                sectionHeader("app_tokens_dimension_size_iconWith_tech")
            }

            Section {
                VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                    ForEach(NamedSize.MaxWidth.allCases, id: \.rawValue) { namedSize in
                        IllustrationMaxWidth(namedSize: namedSize)
                    }
                }
            } header: {
                sectionHeader("app_tokens_dimension_size_maxWidth_tech")
            }

            Section {
                VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                    ForEach(NamedSize.MinWidth.allCases, id: \.rawValue) { namedSize in
                        IllustrationMinWidth(namedSize: namedSize)
                    }
                }
            } header: {
                sectionHeader("app_tokens_dimension_size_minInteractiveArea_tech")
            }
        }
        .gridMargin(.horizontal)
    }

    private func sectionHeader(_ text: LocalizedStringKey) -> some View {
        MISOHeading(text, size: .large, hasMarker: true)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
