// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

/// Displays content as vertical layout for watchOS dimensions
struct WatchVerticalLayout<WatchLayout: View>: View {

    private let watchLayout: WatchLayout

    @Environment(\.theme) private var theme

    init(@ViewBuilder watchLayout: () -> WatchLayout) {
        self.watchLayout = watchLayout()
    }

    var body: some View {
        VStack(spacing: theme.spaces.scaledXsmallMobile) {
            watchLayout
        }
    }
}
