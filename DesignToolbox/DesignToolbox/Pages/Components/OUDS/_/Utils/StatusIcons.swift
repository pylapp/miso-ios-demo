// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

enum StatusIcons: DesignToolboxEnumRepresentable {

    /// No status icon for a given component
    case none

    /// Tinted icon for the given component
    case tintedIcon

    /// Raw image without tint for the given component
    case image
}

enum DefinedStatusIcons: DesignToolboxEnumRepresentable {

    /// Tinted icon for the given component
    case tintedIcon

    /// Raw image without tint for the given component
    case image
}
