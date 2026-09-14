// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

extension NamedColor {

    enum Overlay: String, CaseIterable {
        case overlayDropdown
        case overlayTooltip
        case overlayDrag
        case overlayModalSheet
        case overlayBackdrop
        case overlayFloating

        func token(from theme: MISOTheme) -> MultipleColorSemanticToken {
            switch self {
            case .overlayDropdown:
                theme.colors.overlayDropdown
            case .overlayTooltip:
                theme.colors.overlayTooltip
            case .overlayDrag:
                theme.colors.overlayDrag
            case .overlayModalSheet:
                theme.colors.overlayModalSheet
            case .overlayBackdrop:
                theme.colors.overlayBackdrop
            case .overlayFloating:
                theme.colors.overlayFloating
            }
        }
    }
}
