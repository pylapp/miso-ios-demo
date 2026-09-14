// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

enum TextualContentMode: DesignToolboxEnumRepresentable {
    /// To map to MISO TextualContent.attributed(AttributedString)
    case rich
    /// To map to MISO TextualContent.raw(String)
    case raw
}
