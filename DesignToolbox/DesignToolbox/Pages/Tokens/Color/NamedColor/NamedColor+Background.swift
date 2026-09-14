// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

extension NamedColor {

    enum Background: String, CaseIterable {
        case bgPrimary
        case bgSecondary
        case bgTertiary
        case bgInverseHigh
        case bgInverseLow

        func token(from theme: MISOTheme) -> MultipleColorSemanticToken {
            switch self {
            case .bgPrimary:
                theme.colors.bgPrimary
            case .bgSecondary:
                theme.colors.bgSecondary
            case .bgTertiary:
                theme.colors.bgTertiary
            case .bgInverseHigh:
                theme.colors.bgInverseHigh
            case .bgInverseLow:
                theme.colors.bgInverseLow
            }
        }
    }
}
