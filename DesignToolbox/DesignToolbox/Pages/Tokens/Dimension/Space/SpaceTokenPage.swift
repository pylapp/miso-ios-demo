// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Space Token Page

struct SpaceTokenPage: View {

    var body: some View {
        Group {
            #if !os(tvOS) && !os(watchOS)
            // SizeTokenPage.swift file imported in watchOS and tvOS targets
            // But for the Design Toolbox Light app no code section
            Section {
                DesignToolboxCode(code: "theme.scaledMd.dimension(for: horizontalSizeClass ?? .regular)", titleText: "app_tokens_common_viewCodeExample_label")
            }
            #endif
            // Basic Space Tokens
            Section { ScaledSpaceProperty() } header: {
                header("app_tokens_dimension_space_scaled_tech")
            }
            Section { FixedSpaceProperty() } header: {
                header("app_tokens_dimension_space_fixed_tech")
            }
            Section { InsetSpaceProperty() } header: {
                header("app_tokens_dimension_space_inset_tech")
            }
            // Padding Space Tokens
            Section { PaddingInlineProperty() } header: {
                header("app_tokens_dimension_space_paddingInline_tech")
            }
            Section { PaddingBlockProperty() } header: {
                header("app_tokens_dimension_space_paddingBlock_tech")
            }
            // Gap Space Tokens
            Section { ColumnGapProperty() } header: {
                header("app_tokens_dimension_space_columnGap_tech")
            }
            Section { RowGapProperty() } header: {
                header("app_tokens_dimension_space_rowGap_tech")
            }
        }
        .gridMargin(.horizontal)
    }

    // MARK: Common helpers

    private func header(_ text: LocalizedStringKey) -> some View {
        MISOHeading(text, size: .large, hasMarker: true)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
