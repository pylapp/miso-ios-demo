// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct IllustrationFont: View {

    let namedFont: NamedFont

    private var token: FontCompositeSemanticToken {
        namedFont.token(from: theme).fontToken(for: horizontalSizeClass ?? .regular)
    }

    @Environment(\.theme) private var theme
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            illustration(for: namedFont, in: theme)
                .foregroundStyle(theme.colors.contentDefault)

            Group {
                Text(familyText)
                    + Text(weightText)
                    + Text(sizeText)
                    + Text(lineHeightText)
                    + Text(letterSpacingText)
            }
            .bodyDefaultMedium(theme)
            .fixedSize(horizontal: false, vertical: true)
            .foregroundStyle(theme.colors.contentMuted)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, theme.spaces.fixedXsmall)
        .accessibilityElement(children: .combine)
        .tvOSFocusableRow()
    }

    private var familyText: String {
        let fontFamilyName = switch namedFont {
        case .displayLarge, .displayMedium, .displaySmall:
            theme.fonts.familyDisplay
        case .headingXLarge, .headingLarge, .headingMedium, .headingSmall:
            theme.fonts.familyHeading
        case .bodyDefaultLarge, .bodyDefaultMedium, .bodyDefaultSmall,
             .bodyModerateLarge, .bodyModerateMedium, .bodyModerateSmall,
             .bodyStrongLarge, .bodyStrongMedium, .bodyStrongSmall:
            theme.fonts.familyBody
        case .labelDefaultXLarge, .labelDefaultLarge, .labelDefaultMedium, .labelDefaultSmall,
             .labelModerateXLarge, .labelModerateLarge, .labelModerateMedium, .labelModerateSmall,
             .labelStrongXLarge, .labelStrongLarge, .labelStrongMedium, .labelStrongSmall:
            theme.fonts.familyLabel
        case .codeMedium:
            theme.fonts.familyCode
        }
        return "family (\(fontFamilyName)), "
    }

    private var weightText: String {
        "weight (\(token.weight)), "
    }

    private var sizeText: String {
        "size (\(token.size)), "
    }

    private var lineHeightText: String {
        "lineHeight (\(token.lineHeight)), "
    }

    private var letterSpacingText: String {
        "letterSpacing (\(token.letterSpacing))"
    }
}
