// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Heading Page

struct HeadingPage: View {

    @StateObject private var configurationModel: HeadingConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: HeadingConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            HeadingDemo(configurationModel: configurationModel)
        } configurationView: {
            HeadingConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Heading Demo

private struct HeadingDemo: View {

    @StateObject var configurationModel: HeadingConfigurationModel

    var body: some View {
        if configurationModel.hasColoredSubstring {
            MISOHeading(text: configurationModel.text, coloredText: configurationModel.coloredText)
        } else {
            MISOHeading(text: configurationModel.text, size: configurationModel.size, hasMarker: configurationModel.hasMarker)
        }
    }
}
