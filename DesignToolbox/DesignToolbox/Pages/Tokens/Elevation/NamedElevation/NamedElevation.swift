// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

enum NamedElevation: String, CaseIterable {
    case none
    case raised
    case drag
    case `default`
    case emphasized
    case sticky

    func token(from theme: MISOTheme) -> ElevationCompositeSemanticToken {
        switch self {
        case .none:
            theme.elevations.none
        case .raised:
            theme.elevations.raised
        case .drag:
            theme.elevations.drag
        case .default:
            theme.elevations.default
        case .emphasized:
            theme.elevations.emphasized
        case .sticky:
            theme.elevations.sticky
        }
    }
}
