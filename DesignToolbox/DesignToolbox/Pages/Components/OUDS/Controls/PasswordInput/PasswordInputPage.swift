// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

// MARK: Password Input Page

struct PasswordInputPage: View {

    @StateObject private var configurationModel: PasswordInputConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: PasswordInputConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            PasswordInputDemo(configurationModel: configurationModel)
        } configurationView: {
            PasswordInputConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Password Input Demo

struct PasswordInputDemo: View {

    // MARK: - Stored properties

    @StateObject var configurationModel: PasswordInputConfigurationModel

    // MARK: - Body

    var body: some View {
        // To keep things simple, assuming the rich/raw mode is for all parameters
        switch configurationModel.textMode {
        case .raw:
            MISOPasswordInput(label: configurationModel.label,
                              password: $configurationModel.text,
                              isHiddenPassword: $configurationModel.isHiddenPassword,
                              placeholder: configurationModel.placeholderText,
                              prefix: configurationModel.prefixText,
                              lockIcon: configurationModel.lockIcon,
                              helperText: configurationModel.helperText,
                              isOutlined: configurationModel.isOutlined,
                              constrainedMaxWidth: configurationModel.constrainedMaxWidth,
                              status: configurationModel.computedStatus)
                .autocorrectionDisabled()
                .textInputDisableAutocapitalization()
        case .rich:
            MISOPasswordInput(label: configurationModel.label,
                              password: $configurationModel.text,
                              isHiddenPassword: $configurationModel.isHiddenPassword,
                              placeholder: configurationModel.placeholderText,
                              prefix: configurationModel.prefixText,
                              lockIcon: configurationModel.lockIcon,
                              helperText: configurationModel.richHelperText,
                              isOutlined: configurationModel.isOutlined,
                              constrainedMaxWidth: configurationModel.constrainedMaxWidth,
                              status: configurationModel.computedStatus)
                .autocorrectionDisabled()
                .textInputDisableAutocapitalization()
        }
    }
}

#endif
