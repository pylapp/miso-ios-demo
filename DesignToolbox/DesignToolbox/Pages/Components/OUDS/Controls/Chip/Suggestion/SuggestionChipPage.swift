// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Chip page

struct SuggestionChipPage: View {

    @StateObject private var configurationModel: SuggestionChipConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: SuggestionChipConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            SuggestionChipDemo(configurationModel: configurationModel)
        } configurationView: {
            SuggestionChipConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - SuggestionChip Demo

struct SuggestionChipDemo: View {

    @StateObject var configurationModel: SuggestionChipConfigurationModel

    var body: some View {
        Group {
            switch configurationModel.layout {
            case .iconOnly:
                MISOSuggestionChip(image: oudsImage,
                                   accessibilityLabel: "app_components_common_icon_a11y".localized()) {}
            case .textOnly:
                MISOSuggestionChip(text: configurationModel.text) {}
            case .textAndIcon:
                MISOSuggestionChip(image: oudsImage, text: configurationModel.text) {}
            }
        }
        .disabled(!configurationModel.enabled)
    }

    private var oudsImage: MISOImage {
        let asset: Image = configurationModel.iconType == .tintedIcon
            ? Image(decorative: "ic_heart")
            : Image.placeholderImage()
        let renderingMode: Image.TemplateRenderingMode = configurationModel.iconType == .tintedIcon ? .template : .original
        return MISOImage(asset: asset, renderingMode: renderingMode)
    }
}
