// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

extension NamedSpace {

    enum RowGap: String, CaseIterable, NamedSpaceToken {
        case rowGapNone
        case rowGap3xsmall
        case rowGap2xsmall
        case rowGapXsmall
        case rowGapSmall
        case rowGapMedium
        case rowGapLarge

        var name: String { rawValue }

        func token(from theme: MISOTheme) -> SpaceSemanticToken {
            switch self {
            case .rowGapNone:
                theme.spaces.rowGapNone
            case .rowGap3xsmall:
                theme.spaces.rowGap3xsmall
            case .rowGap2xsmall:
                theme.spaces.rowGap2xsmall
            case .rowGapXsmall:
                theme.spaces.rowGapXsmall
            case .rowGapSmall:
                theme.spaces.rowGapSmall
            case .rowGapMedium:
                theme.spaces.rowGapMedium
            case .rowGapLarge:
                theme.spaces.rowGapLarge
            }
        }
    }
}
