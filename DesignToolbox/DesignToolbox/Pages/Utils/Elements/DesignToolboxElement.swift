// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI

@MainActor
protocol DesignToolboxElement {
    var name: String { get }
    var illustration: AnyView { get }
    var pageDescription: AnyView { get }
}

extension DesignToolboxElement {
    var id: String { name }
}
