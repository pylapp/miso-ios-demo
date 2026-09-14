// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Checkbox Item Page

struct CheckboxItemPage: View {

    @StateObject private var configurationModel: BooleanControlItemConfigurationModel

    init() {
        let model = BooleanControlItemConfigurationModel(componentInitCode: "MISOCheckboxItem(", bindingInitCode: "isOn: $isOn")
        _configurationModel = StateObject(wrappedValue: model)
    }

    var body: some View {
        ControlItemElementPage(configurationModel: configurationModel) {
            CheckboxItemDemo(configurationModel: configurationModel)
        }
    }
}

// MARK: - Checkbox Item Demo

private struct CheckboxItemDemo: View {

    @ObservedObject var configurationModel: BooleanControlItemConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        switch configurationModel.textMode {
        case .raw:
            MISOCheckboxItem(configurationModel.labelText,
                             isOn: $configurationModel.isOn,
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
                .accessibilityIdentifier(A11YIdentifiers.componentCheckboxItem)
        case .rich:
            MISOCheckboxItem(configurationModel.labelText,
                             isOn: $configurationModel.isOn,
                             description: configurationModel.descriptionText,
                             image: image,
                             isReversed: configurationModel.isReversed,
                             isError: configurationModel.isError,
                             errorText: configurationModel.richErrorText,
                             isReadOnly: configurationModel.isReadOnly,
                             hasDivider: configurationModel.hasDivider,
                             constrainedMaxWidth: configurationModel.constrainedMaxWidth)
                .disabled(!configurationModel.enabled)
                .designToolboxColoredSurface(false)
                .accessibilityIdentifier(A11YIdentifiers.componentCheckboxItem)
        }
    }

    private var image: MISOImage? {
        guard configurationModel.icon else { return nil }
        let asset: Image = configurationModel.rawImage ? Image.placeholderImage() : Image.defaultImage(prefixedBy: theme.name)
        let renderingMode: Image.TemplateRenderingMode = configurationModel.rawImage ? .original : .template
        return MISOImage(asset: asset, flipped: configurationModel.flipIcon, renderingMode: renderingMode)
    }
}
