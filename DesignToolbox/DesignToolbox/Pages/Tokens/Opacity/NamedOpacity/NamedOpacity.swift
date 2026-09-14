// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

enum NamedOpacity: String, CaseIterable {
    case invisible
    case weakest
    case weaker
    case weak
    case medium
    case strong
    case opaque
    case disabled

    func token(from theme: MISOTheme) -> OpacitySemanticToken {
        switch self {
        case .invisible:
            theme.opacities.invisible
        case .weakest:
            theme.opacities.weakest
        case .weaker:
            theme.opacities.weaker
        case .weak:
            theme.opacities.weak
        case .medium:
            theme.opacities.medium
        case .strong:
            theme.opacities.strong
        case .opaque:
            theme.opacities.opaque
        case .disabled:
            theme.opacities.disabled
        }
    }
}
