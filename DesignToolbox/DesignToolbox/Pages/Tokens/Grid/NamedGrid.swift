// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

enum NamedGrid: String, CaseIterable {
    case minWidth
    case maxWidth
    case margin
    case columnGap

    @MainActor
    func token(from theme: MISOTheme, for sizeClass: MISOUserInterfaceSizeClass) -> GridRawToken {
        switch self {
        case .minWidth:
            theme.gridMinWidth(for: sizeClass)
        case .maxWidth:
            theme.gridMaxWidth(for: sizeClass)
        case .margin:
            theme.gridMargin(for: sizeClass)
        case .columnGap:
            theme.gridColumnGap(for: sizeClass)
        }
    }
}
