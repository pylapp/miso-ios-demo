// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

//
// Software Name: OUDS iOS
// SPDX-FileCopyrightText: Copyright (c) Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license,
// the text of which is available at https://opensource.org/license/MIT/
// or see the "LICENSE" file for more details.
//
// Authors: See CONTRIBUTORS.txt
// Software description: A SwiftUI components library with code examples for Orange Unified Design System
//

import MISOSwiftUI
import SwiftUI

// MARK: Divider page

struct DividerPage: View {

    @StateObject private var configurationModel: DividerConfigurationModel

    init(orientation: DividerConfigurationModel.Orientation) {
        _configurationModel = StateObject(wrappedValue: DividerConfigurationModel(orientation: orientation))
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            DividerDemo(configurationModel: configurationModel)
        } configurationView: {
            DividerConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Divider Demo

struct DividerDemo: View {

    @StateObject var configurationModel: DividerConfigurationModel

    var body: some View {
        switch configurationModel.orientation {
        case .horizontal:
            MISOHorizontalDivider(color: configurationModel.selectedColor)
        case .vertical:
            MISOVerticalDivider(color: configurationModel.selectedColor)
        }
    }
}
