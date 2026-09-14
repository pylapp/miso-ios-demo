// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

enum NamedSpace {}

/// Interface all `NamedSpace` tokens must implement  provide a displayable name and the sementic token
protocol NamedSpaceToken {
    var name: String { get }

    func token(from theme: MISOTheme) -> SpaceSemanticToken
}
