// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

extension NamedSize {
    enum IconDecorative: String, CaseIterable {
        case iconDecorative4xsmall
        case iconDecorative3xsmall
        case iconDecorative2xsmall
        case iconDecorativeXsmall
        case iconDecorativeSmall
        case iconDecorativeMedium
        case iconDecorativeLarge
        case iconDecorativeXlarge
        case iconDecorative2xlarge

        func token(from theme: MISOTheme) -> SizeSemanticToken {
            switch self {
            case .iconDecorative4xsmall:
                theme.sizes.iconDecorative4xsmall
            case .iconDecorative3xsmall:
                theme.sizes.iconDecorative3xsmall
            case .iconDecorative2xsmall:
                theme.sizes.iconDecorative2xsmall
            case .iconDecorativeXsmall:
                theme.sizes.iconDecorativeXsmall
            case .iconDecorativeSmall:
                theme.sizes.iconDecorativeSmall
            case .iconDecorativeMedium:
                theme.sizes.iconDecorativeMedium
            case .iconDecorativeLarge:
                theme.sizes.iconDecorativeLarge
            case .iconDecorativeXlarge:
                theme.sizes.iconDecorativeXlarge
            case .iconDecorative2xlarge:
                theme.sizes.iconDecorative2xlarge
            }
        }
    }
}
