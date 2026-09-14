// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Colored Surface Page

struct ColoredSurfacePage: View {

    @StateObject private var configurationModel: ColoredSurfaceConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: ColoredSurfaceConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            ColoredSurfaceDemo(configurationModel: configurationModel)
        } configurationView: {
            ColoredSurfaceConfiguration(configurationModel: configurationModel)
        }
    }
}

// MARK: - Colored Surface Demo

private struct ColoredSurfaceDemo: View {

    @ObservedObject var configurationModel: ColoredSurfaceConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        MISOColoredSurface(color: configurationModel.selectedColor.toSurfaceColor(from: theme)) {
            VStack(alignment: .center, spacing: theme.spaces.fixedMedium) {
                Text(configurationModel.selectedColor.formattedName)
                    .foregroundColor(theme.colors.contentDefault)

                MISOButton("app_components_button_tech",
                           appearance: .default,
                           style: .default) {}

                MISOLink("app_components_link_tech", indicator: .next) {}
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.all, theme.spaces.fixedMedium)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.all, theme.spaces.fixedMedium)
    }
}
