// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Link page

struct LinkPage: View {

    @StateObject private var configurationModel: LinkConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: LinkConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            LinkDemo(configurationModel: configurationModel)
        } configurationView: {
            LinkConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Link Demo

private struct LinkDemo: View {

    @StateObject var configurationModel: LinkConfigurationModel

    var body: some View {
        link
            .disabled(!configurationModel.enabled)
    }

    @ViewBuilder private var link: some View {
        switch configurationModel.layout {
        case .textOnly:
            MISOLink(text: configurationModel.text,
                     size: configurationModel.size,
                     density: configurationModel.density) {}
        case .textAndIcon:
            MISOLink(text: configurationModel.text,
                     image: image,
                     size: configurationModel.size,
                     density: configurationModel.density) {}
        case .indicatorPrevious:
            MISOLink(text: configurationModel.text,
                     indicator: .previous,
                     size: configurationModel.size,
                     density: configurationModel.density,
                     isFullWidth: configurationModel.isFullWidth) {}
        case .indicatorNext:
            MISOLink(text: configurationModel.text,
                     indicator: .next,
                     size: configurationModel.size,
                     density: configurationModel.density,
                     isFullWidth: configurationModel.isFullWidth) {}
        case .indicatorExternal:
            MISOLink(text: configurationModel.text,
                     indicator: .external,
                     size: configurationModel.size,
                     density: configurationModel.density,
                     isFullWidth: configurationModel.isFullWidth) {}
        }
    }

    private var image: MISOImage {
        let asset: Image = configurationModel.iconType == .tintedIcon
            ? Image(decorative: "ic_heart")
            : Image.placeholderImage()
        let renderingMode: Image.TemplateRenderingMode = configurationModel.iconType == .tintedIcon ? .template : .original
        return MISOImage(asset: asset, renderingMode: renderingMode)
    }
}
