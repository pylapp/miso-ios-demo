// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct IllustrationElevation: View {

    let namedElevation: NamedElevation

    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        let token = namedElevation.token(from: theme)
        let name = namedElevation.rawValue
        let value = description(for: token)

        DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
            Rectangle()
                .frame(width: theme.sizes.iconDecorative2xlarge, height: theme.sizes.iconDecorative2xlarge)
                .foregroundColor(theme.colors.bgSecondary)
                .shadow(token)
                .padding(.bottom, 2)
        }
    }

    private func description(for token: ElevationCompositeSemanticToken) -> String {
        let colorBasedToken = colorScheme == .light ? token.light : token.dark
        let x = colorBasedToken.x
        let y = colorBasedToken.y
        let radius = colorBasedToken.radius
        let color = colorBasedToken.color
        return String(format: "x: %.2f, y: %.2f, radius: %.2f\nColor: %@", x, y, radius, color)
    }
}
