// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

extension NamedSpace {

    enum Scaled: String, CaseIterable {
        case scaledNone
        case scaled3xsmall
        case scaled2xsmall
        case scaledXsmall
        case scaledSmall
        case scaledMedium
        case scaledLarge
        case scaledXlarge
        case scaled2xlarge
        case scaled3xlarge

        func token(from theme: MISOTheme) -> MultipleSpaceSemanticToken {
            switch self {
            case .scaledNone:
                theme.spaces.scaledNone
            case .scaled3xsmall:
                theme.spaces.scaled3xsmall
            case .scaled2xsmall:
                theme.spaces.scaled2xsmall
            case .scaledXsmall:
                theme.spaces.scaledXsmall
            case .scaledSmall:
                theme.spaces.scaledSmall
            case .scaledMedium:
                theme.spaces.scaledMedium
            case .scaledLarge:
                theme.spaces.scaledLarge
            case .scaledXlarge:
                theme.spaces.scaledXlarge
            case .scaled2xlarge:
                theme.spaces.scaled2xlarge
            case .scaled3xlarge:
                theme.spaces.scaled3xlarge
            }
        }
    }
}
