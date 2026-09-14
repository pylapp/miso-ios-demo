// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

/// Using Swift files from DesignToolbox folder, displays simply the spaces tokens
struct SpacesView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(layout: { WatchVerticalLayout { watchLayout } })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            Section("Scaled") {
                ScaledSpaceProperty()
            }
            Section("Fixed") {
                FixedSpaceProperty()
            }
            Section("Inset") {
                InsetSpaceProperty()
            }
            Section("Padding inline") {
                PaddingInlineProperty()
            }
            Section("Padding block") {
                PaddingBlockProperty()
            }
            Section("Column gap") {
                ColumnGapProperty()
            }
            Section("Row gap") {
                RowGapProperty()
            }
        }
    }
}
