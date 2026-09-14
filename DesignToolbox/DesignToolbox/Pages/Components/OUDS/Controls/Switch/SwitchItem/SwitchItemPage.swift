// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Switch Item Page

struct SwitchItemPage: View {

    @StateObject private var configurationModel: BooleanControlItemConfigurationModel

    init() {
        let model = BooleanControlItemConfigurationModel(componentInitCode: "MISOSwitchItem(", bindingInitCode: "isOn: $isOn")
        _configurationModel = StateObject(wrappedValue: model)
    }

    var body: some View {
        ControlItemElementPage(configurationModel: configurationModel) {
            SwitchItemDemo(configurationModel: configurationModel)
        }
    }
}

// MARK: - Switch Item Demo

private struct SwitchItemDemo: View {

    @ObservedObject var configurationModel: BooleanControlItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        // To keep things simple, assuming the rich/raw mode is for all parameters
        switch configurationModel.textMode {
        case .raw:
            MISOSwitchItem(configurationModel.labelText,
                           isOn: $configurationModel.isOn,
                           description: configurationModel.descriptionText,
                           image: image,
                           isReversed: !configurationModel.isReversed,
                           isError: configurationModel.isError,
                           errorText: configurationModel.errorText,
                           isReadOnly: configurationModel.isReadOnly,
                           hasDivider: configurationModel.hasDivider,
                           constrainedMaxWidth: configurationModel.constrainedMaxWidth)
                .disabled(!configurationModel.enabled)
                .accessibilityIdentifier(A11YIdentifiers.componentSwitchItem)
        case .rich:
            MISOSwitchItem(configurationModel.labelText,
                           isOn: $configurationModel.isOn,
                           description: configurationModel.descriptionText,
                           image: image,
                           isReversed: !configurationModel.isReversed,
                           isError: configurationModel.isError,
                           errorText: configurationModel.richErrorText,
                           isReadOnly: configurationModel.isReadOnly,
                           hasDivider: configurationModel.hasDivider,
                           constrainedMaxWidth: configurationModel.constrainedMaxWidth)
                .disabled(!configurationModel.enabled)
                .accessibilityIdentifier(A11YIdentifiers.componentSwitchItem)
        }
    }

    private var image: MISOImage? {
        guard configurationModel.icon else { return nil }
        let asset: Image = configurationModel.rawImage ? Image.placeholderImage() : Image.defaultImage(prefixedBy: theme.name)
        let renderingMode: Image.TemplateRenderingMode = configurationModel.rawImage ? .original : .template
        return MISOImage(asset: asset, flipped: configurationModel.flipIcon, renderingMode: renderingMode)
    }
}
