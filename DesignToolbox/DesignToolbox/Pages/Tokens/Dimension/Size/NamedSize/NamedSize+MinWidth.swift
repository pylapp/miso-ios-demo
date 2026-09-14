// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

extension NamedSize {
    enum MinWidth: String, CaseIterable {
        case minInteractiveArea
        case minInteractiveAreaSmall
        case minInteractiveAreaSmallest

        func token(for theme: MISOTheme) -> SizeSemanticToken {
            switch self {
            case .minInteractiveArea:
                theme.sizes.minInteractiveAreaDefault
            case .minInteractiveAreaSmall:
                theme.sizes.minInteractiveAreaSmall
            case .minInteractiveAreaSmallest:
                theme.sizes.minInteractiveAreaSmallest
            }
        }
    }
}
