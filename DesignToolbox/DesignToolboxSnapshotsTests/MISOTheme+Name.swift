// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

extension MISOTheme {

    /// The name of the theme used in snapshots files names
    var name: String {
        if self is OrangeTheme {
            return OrangeTheme.name
        }
        if self is OrangeCompactTheme {
            return OrangeCompactTheme.name
        }
        if self is SoshTheme {
            return SoshTheme.name
        }
        if self is BlueCoatTheme {
            return BlueCoatTheme.name
        }
        return String(describing: Self.self)
    }
}
