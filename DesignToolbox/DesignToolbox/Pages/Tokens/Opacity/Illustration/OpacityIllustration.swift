// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT
import MISOSwiftUI
import SwiftUI

struct IllustrationOpacity: View {
    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    let opacityName: NamedOpacity

    var body: some View {
        let token = opacityName.token(from: theme)
        let name = opacityName.rawValue
        let value = String(format: "%.2f", token)

        DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
            ZStack(alignment: .topLeading) {
                Image(decorative: "ic_union")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(theme.colors.contentStatusInfo)
                    .frame(width: 48, height: 48)
                    .accessibilityHidden(true)

                Rectangle()
                    .fill(theme.colors.overlayModalSheet.color(for: colorScheme))
                    .opacity(token)
                    .frame(width: 48, height: 48)
                    .border(style: theme.borders.styleDefault,
                            width: theme.borders.widthThin,
                            radius: theme.borders.radiusNone,
                            color: theme.colors.borderDefault)
                    .padding(.top, 12)
                    .padding(.leading, 12)
            }
        }
    }
}
