// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

extension NamedColor {

    enum Always: String, CaseIterable {
        case alwaysBlack
        case alwaysOnBlack
        case alwaysOnWhite
        case alwaysWhite

        func token(from theme: MISOTheme) -> ColorSemanticToken {
            switch self {
            case .alwaysBlack:
                theme.colors.alwaysBlack
            case .alwaysOnBlack:
                theme.colors.alwaysOnBlack
            case .alwaysOnWhite:
                theme.colors.alwaysOnWhite
            case .alwaysWhite:
                theme.colors.alwaysWhite
            }
        }
    }
}
