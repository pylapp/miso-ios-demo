// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

extension NamedSpace {

    enum ColumnGap: String, CaseIterable, NamedSpaceToken {
        case columnGapNone
        case columnGap3xsmall
        case columnGap2xsmall
        case columnGapXsmall
        case columnGapSmall
        case columnGapMedium
        case columnGapLarge
        case columnGapXlarge
        case columnGap2xlarge

        var name: String { rawValue }

        func token(from theme: MISOTheme) -> SpaceSemanticToken {
            switch self {
            case .columnGapNone:
                theme.spaces.columnGapNone
            case .columnGap3xsmall:
                theme.spaces.columnGap3xsmall
            case .columnGap2xsmall:
                theme.spaces.columnGap2xsmall
            case .columnGapXsmall:
                theme.spaces.columnGapXsmall
            case .columnGapSmall:
                theme.spaces.columnGapSmall
            case .columnGapMedium:
                theme.spaces.columnGapMedium
            case .columnGapLarge:
                theme.spaces.columnGapLarge
            case .columnGapXlarge:
                theme.spaces.columnGapXlarge
            case .columnGap2xlarge:
                theme.spaces.columnGap2xlarge
            }
        }
    }
}
