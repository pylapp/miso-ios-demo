// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Colored Surface Configuration Model

/// The model shared between `ColoredSurfacePageConfiguration` view and `ColoredSurfacePageComponent` view.
final class ColoredSurfaceConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var selectedColor: NamedColorMode {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        selectedColor = NamedColorMode.onBrandPrimary
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code =
            """
            MISOColoredSurface(color: theme.colorModes.\(selectedColor.description)) {
               Text("\(selectedColor.formattedName)")
               .foregroundColor(theme.colors.contentDefault)

               MISOButton(text: "\("app_components_button_tech".localized())") {}

               MISOLink(text: "\("app_components_link_tech".localized())", indicator: .next) {}
            }
            """
    }
}

// MARK: - Colored Surface Configuration View

struct ColoredSurfaceConfiguration: View {

    @StateObject var configurationModel: ColoredSurfaceConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        DesignToolboxColorPicker {
            ForEach(NamedColorMode.allCases, id: \.id) { color in
                if !color.toSurfaceColor(from: theme).hasUndefinedValue() {
                    Button {
                        configurationModel.selectedColor = color
                    } label: {
                        ColorEntry(color: color)
                    }
                }
            }
        } selectedColor: {
            ColorEntry(color: configurationModel.selectedColor)
        }
    }
}

private struct ColorEntry: View {

    @Environment(\.theme) private var theme
    let color: NamedColorMode

    var body: some View {
        DesignToolboxColorEntry(colorName: color.formattedName) {
            MISOColoredSurface(color: color.toSurfaceColor(from: theme)) {
                Rectangle()
                    .fill(Color.clear)
            }
        }
    }
}
