// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

// MARK: - TextArea page

struct TextAreaPage: View {

    @StateObject private var configurationModel: TextAreaConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: TextAreaConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            TextAreaDemo(configurationModel: configurationModel)
        } configurationView: {
            TextAreaConfigurationView(configurationModel: configurationModel)
        }
        .misoHideKeyboardOnTap()
    }
}

// MARK: - TextArea Demo

struct TextAreaDemo: View {

    // MARK: - Stored properties

    @StateObject var configurationModel: TextAreaConfigurationModel
    @Environment(\.openURL) private var openUrl

    // MARK: - Body

    var body: some View {
        MISOTextArea(label: configurationModel.label,
                     text: $configurationModel.text,
                     placeholder: configurationModel.placeholderText,
                     helperText: configurationModel.computedHelperText,
                     helperLink: helperLink,
                     isOutlined: configurationModel.isOutlined,
                     constrainedMaxWidth: configurationModel.constrainedMaxWidth,
                     constrainedMaxHeight: configurationModel.constrainedMaxHeight,
                     status: configurationModel.computedStatus)
    }

    private var helperLink: MISOTextArea.Helperlink? {
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
