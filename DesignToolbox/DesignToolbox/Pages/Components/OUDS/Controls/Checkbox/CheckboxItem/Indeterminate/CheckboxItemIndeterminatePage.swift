// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Checkbox Item Indeterminate Page

struct CheckboxItemIndeterminatePage: View {

    @StateObject private var configurationModel: IndicatorControlItemConfigurationModel

    init() {
        let model = IndicatorControlItemConfigurationModel(componentInitCode: "MISOCheckboxItemIndeterminate(", bindingInitCode: "selection: $selection")
        _configurationModel = StateObject(wrappedValue: model)
    }

    var body: some View {
        ControlItemElementPage(configurationModel: configurationModel) {
            CheckboxItemIndeterminateDemo(configurationModel: configurationModel)
        }
    }
}

// MARK: - Checkbox Item Indeterminate Demo

private struct CheckboxItemIndeterminateDemo: View {

    @ObservedObject var configurationModel: IndicatorControlItemConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        MISOCheckboxItemIndeterminate(configurationModel.labelText,
                                      selection: $configurationModel.selection,
                                      description: configurationModel.descriptionText,
                                      image: image,
                                      isReversed: configurationModel.isReversed,
                                      isError: configurationModel.isError,
                                      errorText: configurationModel.errorText,
                                      isReadOnly: configurationModel.isReadOnly,
                                      hasDivider: configurationModel.hasDivider,
                                      constrainedMaxWidth: configurationModel.constrainedMaxWidth)
            .disabled(!configurationModel.enabled)
            .designToolboxColoredSurface(false)
            .accessibilityIdentifier(A11YIdentifiers.componentCheckboxItemIndeterminate)
    }

    private var image: MISOImage? {
        guard configurationModel.icon else { return nil }
        let asset: Image = configurationModel.rawImage ? Image.placeholderImage() : Image.defaultImage(prefixedBy: theme.name)
        let renderingMode: Image.TemplateRenderingMode = configurationModel.rawImage ? .original : .template
        return MISOImage(asset: asset, flipped: configurationModel.flipIcon, renderingMode: renderingMode)
    }
}
