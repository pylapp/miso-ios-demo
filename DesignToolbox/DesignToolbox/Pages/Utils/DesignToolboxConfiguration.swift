// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct DesignToolboxConfiguration<Configuration>: View where Configuration: View {

    // MARK: Environment properties

    @Environment(\.theme) private var theme

    // MARK: Stored properties

    @ViewBuilder
    let configuration: () -> Configuration

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            Group {
                MISOHeading("app_common_configuration_label", size: .medium)
                    .foregroundColor(theme.colors.contentDefault)
                    .frame(maxWidth: .infinity, alignment: .leading)

                MISOHorizontalDivider()
            }
            .padding(.horizontal, theme.spaces.fixedMedium)

            configuration()
        }
        .padding(.vertical, theme.spaces.fixedMedium)
        .border(style: theme.borders.styleDefault,
                width: theme.borders.widthThin,
                radius: theme.borders.radiusMedium,
                color: theme.colors.borderDefault)
    }
}
