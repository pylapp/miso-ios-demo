// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

extension NamedSize {
    enum MaxWidth: String, CaseIterable {
        case maxWidthDisplayLarge
        case maxWidthDisplayMedium
        case maxWidthDisplaySmall
        case maxWidthHeadingXlarge
        case maxWidthHeadingLarge
        case maxWidthHeadingMedium
        case maxWidthHeadingSmall
        case maxWidthBodyLarge
        case maxWidthBodyMedium
        case maxWidthBodySmall
        case maxWidthLabelXlarge
        case maxWidthLabelLarge
        case maxWidthLabelMedium
        case maxWidthLabelSmall

        func token(for theme: MISOTheme, userInterfaceSizeClass: UserInterfaceSizeClass) -> SizeSemanticToken {
            switch self {
            case .maxWidthDisplayLarge:
                theme.sizes.maxWidthDisplayLarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthDisplayMedium:
                theme.sizes.maxWidthDisplayMedium.dimension(for: userInterfaceSizeClass)
            case .maxWidthDisplaySmall:
                theme.sizes.maxWidthDisplaySmall.dimension(for: userInterfaceSizeClass)
            case .maxWidthHeadingXlarge:
                theme.sizes.maxWidthHeadingXlarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthHeadingLarge:
                theme.sizes.maxWidthHeadingLarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthHeadingMedium:
                theme.sizes.maxWidthHeadingMedium.dimension(for: userInterfaceSizeClass)
            case .maxWidthHeadingSmall:
                theme.sizes.maxWidthHeadingSmall.dimension(for: userInterfaceSizeClass)
            case .maxWidthBodyLarge:
                theme.sizes.maxWidthBodyLarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthBodyMedium:
                theme.sizes.maxWidthBodyMedium.dimension(for: userInterfaceSizeClass)
            case .maxWidthBodySmall:
                theme.sizes.maxWidthBodySmall.dimension(for: userInterfaceSizeClass)
            case .maxWidthLabelXlarge:
                theme.sizes.maxWidthLabelXlarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthLabelLarge:
                theme.sizes.maxWidthLabelLarge.dimension(for: userInterfaceSizeClass)
            case .maxWidthLabelMedium:
                theme.sizes.maxWidthLabelMedium.dimension(for: userInterfaceSizeClass)
            case .maxWidthLabelSmall:
                theme.sizes.maxWidthLabelSmall.dimension(for: userInterfaceSizeClass)
            }
        }
    }
}
