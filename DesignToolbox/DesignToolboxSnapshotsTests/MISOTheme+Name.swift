// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne

import MISOSwiftUI

extension MISOTheme {

    /// The name of the theme used in snapshots files names
    var name: String {
        if self is FoxyRoughTheme {
            return "FoxyRough"
        }
        if self is BlueCoatTheme {
            return "BlueCoat"
        }
        return String(describing: Self.self)
    }
}
