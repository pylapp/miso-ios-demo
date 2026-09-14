// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

extension NamedSpace {

    enum Inset: String, CaseIterable, NamedSpaceToken {
        case insetNone
        case inset5xsmall
        case inset4xsmall
        case inset3xsmall
        case inset2xsmall
        case insetXsmall
        case insetSmall
        case insetMedium
        case insetLarge
        case insetXlarge
        case inset2xlarge
        case inset3xlarge

        var name: String { rawValue }

        func token(from theme: MISOTheme) -> SpaceSemanticToken {
            switch self {
            case .insetNone:
                theme.spaces.insetNone
            case .inset5xsmall:
                theme.spaces.inset5xsmall
            case .inset4xsmall:
                theme.spaces.inset4xsmall
            case .inset3xsmall:
                theme.spaces.inset3xsmall
            case .inset2xsmall:
                theme.spaces.inset2xsmall
            case .insetXsmall:
                theme.spaces.insetXsmall
            case .insetSmall:
                theme.spaces.insetSmall
            case .insetMedium:
                theme.spaces.insetMedium
            case .insetLarge:
                theme.spaces.insetLarge
            case .insetXlarge:
                theme.spaces.insetXlarge
            case .inset2xlarge:
                theme.spaces.inset2xlarge
            case .inset3xlarge:
                theme.spaces.inset3xlarge
            }
        }
    }
}
