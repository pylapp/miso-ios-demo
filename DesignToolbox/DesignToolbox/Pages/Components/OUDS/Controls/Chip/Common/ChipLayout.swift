// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

// MARK: - Chip Layout

enum ChipLayout: DesignToolboxEnumLocalizedRepresentable {
    case textOnly, textAndIcon, iconOnly

    var wordingKey: String {
        switch self {
        case .textOnly:
            "app_components_common_textOnlyLayout_tech"
        case .textAndIcon:
            "app_components_common_textAndIconLayout_tech"
        case .iconOnly:
            "app_components_common_iconOnlyLayout_tech"
        }
    }
}
