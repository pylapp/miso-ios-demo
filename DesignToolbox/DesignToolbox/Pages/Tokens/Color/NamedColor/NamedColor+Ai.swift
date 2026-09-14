// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

extension NamedColor {

    enum Ai: String, CaseIterable {
        case colorAiPrimary
        case colorAiSecondary
        case colorAiTertiary
        case colorAiQuaternary

        func token(from theme: MISOTheme) -> MultipleColorSemanticToken {
            switch self {
            case .colorAiPrimary:
                theme.colors.colorAiPrimary
            case .colorAiSecondary:
                theme.colors.colorAiSecondary
            case .colorAiTertiary:
                theme.colors.colorAiTertiary
            case .colorAiQuaternary:
                theme.colors.colorAiQuaternary
            }
        }
    }
}
