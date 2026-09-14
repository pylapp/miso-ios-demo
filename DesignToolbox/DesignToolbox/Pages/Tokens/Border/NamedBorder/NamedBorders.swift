// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

enum NamedBorderRadius: String, CaseIterable {
    case radiusNone
    case radiusDefault
    case radiusSmall
    case radiusMedium
    case radiusLarge
    case radiusPill

    func token(from theme: MISOTheme) -> BorderRadiusSemanticToken {
        switch self {
        case .radiusNone:
            theme.borders.radiusNone
        case .radiusDefault:
            theme.borders.radiusDefault
        case .radiusSmall:
            theme.borders.radiusSmall
        case .radiusMedium:
            theme.borders.radiusMedium
        case .radiusLarge:
            theme.borders.radiusLarge
        case .radiusPill:
            theme.borders.radiusPill
        }
    }
}

enum NamedBorderWidth: String, CaseIterable {
    case widthNone
    case widthDefault
    case widthThin
    case widthMedium
    case widthThick
    case widthThicker
    case widthFocus
    case widthFocusInset

    func token(from theme: MISOTheme) -> BorderWidthSemanticToken {
        switch self {
        case .widthNone:
            theme.borders.widthNone
        case .widthDefault:
            theme.borders.widthDefault
        case .widthThin:
            theme.borders.widthThin
        case .widthMedium:
            theme.borders.widthMedium
        case .widthThick:
            theme.borders.widthThick
        case .widthThicker:
            theme.borders.widthThicker
        case .widthFocus:
            theme.borders.widthFocus
        case .widthFocusInset:
            theme.borders.widthFocusInset
        }
    }
}

enum NamedBorderStyle: String, CaseIterable {
    case styleDefault
    case styleDrag

    func token(from theme: MISOTheme) -> BorderStyleSemanticToken {
        switch self {
        case .styleDefault:
            theme.borders.styleDefault
        case .styleDrag:
            theme.borders.styleDrag
        }
    }
}
