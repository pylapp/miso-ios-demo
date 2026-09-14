// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

open class ListItemFlagConfigurationModel: ComponentConfiguration {

    // MARK: Initializer

    deinit {}

    // MARK: Builder

    @MainActor
    var flag: MISOListItemFlag {
        MISOListItemFlag(asset: Image(decorative: "il_flag_fr"), description: "France")
    }

    override func updateCode() {
        code = ".init(asset: Image(\"ic_flag_fr\", description: \"France\"))"
    }
}
