// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne

import SwiftUI

extension UIUserInterfaceStyle {
    var colorScheme: ColorScheme {
        self == .dark ? .dark : .light
    }
}
