// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Chip page

struct FilterChipPage: View {

    @StateObject private var configurationModel: FilterChipConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: FilterChipConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            FilterChipDemo(configurationModel: configurationModel)
        } configurationView: {
            FilterChipConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - FilterChip Demo

struct FilterChipDemo: View {

    @StateObject var configurationModel: FilterChipConfigurationModel

    var body: some View {
        Group {
            switch configurationModel.layout {
            case .iconOnly:
                MISOFilterChip(image: image,
                               accessibilityLabel: "app_components_common_icon_a11y".localized(),
                               selected: configurationModel.selected)
                {
                    configurationModel.selected.toggle()
                }
            case .textOnly:
                MISOFilterChip(text: configurationModel.text, selected: configurationModel.selected) {
                    configurationModel.selected.toggle()
                }
            case .textAndIcon:
                MISOFilterChip(image: image, text: configurationModel.text, selected: configurationModel.selected) {
                    configurationModel.selected.toggle()
                }
            }
        }
        .disabled(!configurationModel.enabled)
    }

    private var image: MISOImage {
        let asset: Image = configurationModel.iconType == .tintedIcon
            ? Image(decorative: "ic_heart")
            : Image.placeholderImage()
        let renderingMode: Image.TemplateRenderingMode = configurationModel.iconType == .tintedIcon ? .template : .original
        return MISOImage(asset: asset, renderingMode: renderingMode)
    }
}
