// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Radio Item Page

struct RadioItemPage: View {
    @StateObject private var configurationModel: BooleanControlItemConfigurationModel

    init() {
        let model = BooleanControlItemConfigurationModel(componentInitCode: "MISORadioItem(",
                                                         bindingInitCode: "isOn: $isOn",
                                                         outlinedConfiguration: (value: false,
                                                                                 outlinedConfigurationLabel: "app_components_common_outlined_tech"),
                                                         extraLabelConfiguration: "app_components_common_extraLabel_tech".localized())
        _configurationModel = StateObject(wrappedValue: model)
    }

    var body: some View {
        ControlItemElementPage(configurationModel: configurationModel) {
            RadioItemDemo(configurationModel: configurationModel)
        }
    }
}

// MARK: - Radio Item Demo

private struct RadioItemDemo: View {

    @ObservedObject var configurationModel: BooleanControlItemConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        // To keep things simple, assuming the rich/raw mode is for all parameters
        switch configurationModel.textMode {
        case .raw:
            MISORadioItem(configurationModel.labelText,
                          isOn: $configurationModel.isOn,
                          extraLabel: configurationModel.extraLabelText,
                          description: configurationModel.descriptionText,
                          image: image,
                          isOutlined: configurationModel.outlined,
                          isReversed: configurationModel.isReversed,
                          isError: configurationModel.isError,
                          errorText: configurationModel.errorText,
                          isReadOnly: configurationModel.isReadOnly,
                          hasDivider: configurationModel.hasDivider,
                          constrainedMaxWidth: configurationModel.constrainedMaxWidth)
                .disabled(!configurationModel.enabled)
                .accessibilityIdentifier(A11YIdentifiers.componentRadioItem)
        case .rich:
            MISORadioItem(configurationModel.labelText,
                          isOn: $configurationModel.isOn,
                          extraLabel: configurationModel.extraLabelText,
                          description: configurationModel.descriptionText,
                          image: image,
                          isOutlined: configurationModel.outlined,
                          isReversed: configurationModel.isReversed,
                          isError: configurationModel.isError,
                          errorText: configurationModel.richErrorText,
                          isReadOnly: configurationModel.isReadOnly,
                          hasDivider: configurationModel.hasDivider,
                          constrainedMaxWidth: configurationModel.constrainedMaxWidth)
                .disabled(!configurationModel.enabled)
                .accessibilityIdentifier(A11YIdentifiers.componentRadioItem)
        }
    }

    private var image: MISOImage? {
        guard configurationModel.icon else { return nil }
        let asset: Image = configurationModel.rawImage ? Image.placeholderImage() : Image.defaultImage(prefixedBy: theme.name)
        let renderingMode: Image.TemplateRenderingMode = configurationModel.rawImage ? .original : .template
        return MISOImage(asset: asset, flipped: configurationModel.flipIcon, renderingMode: renderingMode)
    }
}
