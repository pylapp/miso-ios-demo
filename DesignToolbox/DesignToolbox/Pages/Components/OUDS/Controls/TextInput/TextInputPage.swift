// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

// MARK: TextInput page

struct TextInputPage: View {

    @StateObject private var configurationModel: TextInputConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: TextInputConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            TextInputDemo(configurationModel: configurationModel)
        } configurationView: {
            TextInputConfigurationView(configurationModel: configurationModel)
        }
        .misoHideKeyboardOnTap()
    }
}

// MARK: - TextInput Demo

struct TextInputDemo: View {

    // MARK: - Stored properties

    @StateObject var configurationModel: TextInputConfigurationModel
    @Environment(\.theme) private var theme
    @Environment(\.openURL) private var openUrl

    // MARK: - Body

    var body: some View {
        // To keep things simple, assuming the rich/raw mode is for all parameters
        switch configurationModel.textMode {
        case .raw:
            MISOTextInput(label: configurationModel.label,
                          text: $configurationModel.text,
                          placeholder: configurationModel.placeholderText,
                          prefix: configurationModel.prefixText,
                          suffix: configurationModel.suffixText,
                          leadingImage: leadingImage,
                          trailingAction: trailingAction,
                          helperText: configurationModel.helperText,
                          helperLink: helperLink,
                          isOutlined: configurationModel.isOutlined,
                          constrainedMaxWidth: configurationModel.constrainedMaxWidth,
                          status: configurationModel.computedStatus)
                .autocorrectionDisabled()
                .textInputDisableAutocapitalization()
        case .rich:
            MISOTextInput(label: configurationModel.label,
                          text: $configurationModel.text,
                          placeholder: configurationModel.placeholderText,
                          prefix: configurationModel.prefixText,
                          suffix: configurationModel.suffixText,
                          leadingImage: leadingImage,
                          trailingAction: trailingAction,
                          helperText: configurationModel.richHelperText,
                          helperLink: helperLink,
                          isOutlined: configurationModel.isOutlined,
                          constrainedMaxWidth: configurationModel.constrainedMaxWidth,
                          status: configurationModel.computedStatus)
                .autocorrectionDisabled()
                .textInputDisableAutocapitalization()
        }
    }

    private var leadingImage: MISOImage? {
        guard configurationModel.leadingIcon else { return nil }
        let asset: Image = configurationModel.leadingIconType == .tintedIcon
            ? Image.defaultImage(prefixedBy: theme.name)
            : Image.placeholderImage()
        let renderingMode: Image.TemplateRenderingMode = configurationModel.leadingIconType == .tintedIcon ? .template : .original
        return MISOImage(asset: asset, flipped: configurationModel.flipLeadingIcon, renderingMode: renderingMode)
    }

    private var trailingAction: MISOTextInput.TrailingAction? {
        guard configurationModel.trailingAction else {
            return nil
        }
        let asset: Image = configurationModel.trailingActionIconType == .tintedIcon
            ? Image.defaultImage(prefixedBy: theme.name)
            : Image.placeholderImage()
        let renderingMode: Image.TemplateRenderingMode = configurationModel.trailingActionIconType == .tintedIcon ? .template : .original
        return .init(image: MISOImage(asset: asset,
                                      flipped: configurationModel.flipTrailingActionIcon,
                                      renderingMode: renderingMode),
                     actionHint: "app_components_common_icon_a11y".localized()) {}
    }

    private var helperLink: MISOTextInput.Helperlink? {
        guard !configurationModel.helperLinkText.isEmpty,
              let url = URL(string: "https://unified-design-system.orange.com/")
        else {
            return nil
        }

        return .init(text: configurationModel.helperLinkText) {
            openUrl.callAsFunction(url)
        }
    }
}

#endif
