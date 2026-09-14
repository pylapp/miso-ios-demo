// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Elevation Token Page

struct ElevationTokenPage: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            #if !os(tvOS) && !os(watchOS)
            Section {
                DesignToolboxCode(code: "theme.elevations.none.elevation(for: colorScheme)", titleText: "app_tokens_common_viewCodeExample_label")
            }
            #endif
            Spacer().frame(height: theme.spaces.fixedMedium)

            ForEach(NamedElevation.allCases, id: \.rawValue) { elevationName in
                IllustrationElevation(namedElevation: elevationName)
            }
        }
        .frame(maxWidth: .infinity)
        .gridMargin(.horizontal)
    }
}
