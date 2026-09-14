// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

extension NamedColor {

    enum Action: String, CaseIterable {
        case actionDisabled
        case actionEnabled
        case actionFocus
        case actionHighlighted
        case actionHover
        case actionLoading
        case actionNegativeEnabled
        case actionNegativeFocus
        case actionNegativeHover
        case actionNegativeLoading
        case actionNegativePressed
        case actionPressed
        case actionSelected
        case actionSupportEnabled
        case actionSupportDisabled
        case actionSupportFocus
        case actionSupportHover
        case actionSupportLoading
        case actionSupportPressed
        case actionVisited
        case actionReadOnlyPrimary
        case actionReadOnlySecondary

        func token(from theme: MISOTheme) -> MultipleColorSemanticToken {
            switch self {
            case .actionDisabled:
                theme.colors.actionDisabled
            case .actionEnabled:
                theme.colors.actionEnabled
            case .actionFocus:
                theme.colors.actionFocus
            case .actionHighlighted:
                theme.colors.actionHighlighted
            case .actionHover:
                theme.colors.actionHover
            case .actionLoading:
                theme.colors.actionLoading
            case .actionNegativeEnabled:
                theme.colors.actionNegativeEnabled
            case .actionNegativeFocus:
                theme.colors.actionNegativeFocus
            case .actionNegativeHover:
                theme.colors.actionNegativeHover
            case .actionNegativeLoading:
                theme.colors.actionNegativeLoading
            case .actionNegativePressed:
                theme.colors.actionNegativePressed
            case .actionPressed:
                theme.colors.actionPressed
            case .actionSelected:
                theme.colors.actionSelected
            case .actionSupportEnabled:
                theme.colors.actionSupportEnabled
            case .actionSupportDisabled:
                theme.colors.actionSupportDisabled
            case .actionSupportFocus:
                theme.colors.actionSupportFocus
            case .actionSupportHover:
                theme.colors.actionSupportHover
            case .actionSupportLoading:
                theme.colors.actionSupportLoading
            case .actionSupportPressed:
                theme.colors.actionSupportPressed
            case .actionVisited:
                theme.colors.actionVisited
            case .actionReadOnlyPrimary:
                theme.colors.actionReadOnlyPrimary
            case .actionReadOnlySecondary:
                theme.colors.actionReadOnlySecondary
            }
        }
    }
}
