// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct RectangleBackground: View {
    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        Rectangle()
            .fill(theme.colors.bgSecondary.color(for: colorScheme))
            .frame(width: 64, height: 64)
    }
}

struct IllustrationWidth: View {
    @Environment(\.theme) private var theme

    let namedWidth: NamedBorderWidth

    var body: some View {
        let token = namedWidth.token(from: theme)
        let name = namedWidth.rawValue
        let value = String(format: "%.2f pt", token)

        DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
            RectangleBackground()
                .border(style: theme.borders.styleDefault,
                        width: token,
                        radius: theme.borders.radiusNone,
                        color: theme.colors.borderFocus)
        }
    }
}

struct IllustrationRadius: View {
    @Environment(\.theme) private var theme

    let namedRadius: NamedBorderRadius

    var body: some View {
        let token = namedRadius.token(from: theme)
        let name = namedRadius.rawValue
        let value = String(format: "%.2f pt", token)

        DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
            RectangleBackground()
                .border(style: theme.borders.styleDefault,
                        width: theme.borders.widthDefault,
                        radius: token,
                        color: theme.colors.borderFocus)
        }
    }
}

struct IllustrationStyle: View {
    @Environment(\.theme) private var theme

    let namedStyle: NamedBorderStyle

    var body: some View {
        let token = namedStyle.token(from: theme)
        let name = namedStyle.rawValue
        let value = token

        DesignToolboxTokenIllustration(tokenName: name, tokenValue: value) {
            RectangleBackground()
                .border(style: token,
                        width: theme.borders.widthDefault,
                        radius: theme.borders.radiusNone,
                        color: theme.colors.borderFocus)
        }
    }
}
