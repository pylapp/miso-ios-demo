// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Chip page

struct ChipPickerPage: View {

    @StateObject private var configurationModel: ChipPickerConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: ChipPickerConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            ChipPickerDemo(configurationModel: configurationModel)
        } configurationView: {
            ChipPickerConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - ChipPicker Demo

struct ChipPickerDemo: View {

    @StateObject var configurationModel: ChipPickerConfigurationModel
    @Environment(\.theme) var theme

    var body: some View {
        Group {
            switch configurationModel.selectionType {
            case .singleOrNone:
                MISOChipPicker(title: configurationModel.titleText,
                               selection: $configurationModel.optionalSelectedDrink,
                               chips: configurationModel.drinks())
            case .single:
                MISOChipPicker(title: configurationModel.titleText,
                               selection: $configurationModel.selectedDrink,
                               chips: configurationModel.drinks())
            case .multiple:
                MISOChipPicker(title: configurationModel.titleText,
                               selections: $configurationModel.selectedDrinks,
                               chips: configurationModel.drinks())
            }
        }
        .disabled(!configurationModel.enabled)
    }
}
