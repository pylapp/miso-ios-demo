// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

extension NamedColor {

    enum Opacity: String, CaseIterable {
        case opacityLowest
        case opacityLower
        case opacityTransparent
        case opacityTransparentInverse

        func token(from theme: MISOTheme) -> MultipleColorSemanticToken {
            switch self {
            case .opacityLowest:
                theme.colors.opacityLowest
            case .opacityLower:
                theme.colors.opacityLower
            case .opacityTransparent:
                theme.colors.opacityTransparent
            case .opacityTransparentInverse:
                theme.colors.opacityTransparentInverse
            }
        }
    }
}
