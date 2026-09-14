// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOComponents
import MISOSwiftUI
import SwiftUI

// MARK: - Circular Progress Indicator Page

struct CircularProgressIndicatorPage: View {

    @StateObject private var configurationModel: CircularProgressIndicatorConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: CircularProgressIndicatorConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            CircularProgressIndicatorDemo(configurationModel: configurationModel)
        } configurationView: {
            CircularProgressIndicatorConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Circular Progress Indicator Demo

struct CircularProgressIndicatorDemo: View {

    @StateObject var configurationModel: CircularProgressIndicatorConfigurationModel

    var body: some View {
        Group {
            switch configurationModel.variant {
            case .determinate:
                MISOCircularProgressIndicator(progress: configurationModel.progress,
                                              status: configurationModel.status,
                                              track: configurationModel.track,
                                              gapSize: configurationModel.gapSize,
                                              animated: configurationModel.animated,
                                              helperText: configurationModel.determinateHelperTextValue,
                                              accessibility: configurationModel.accessibilityConfiguration)
            case .indeterminate:
                MISOCircularProgressIndicator(status: configurationModel.status,
                                              track: configurationModel.track,
                                              gapSize: configurationModel.gapSize,
                                              helperText: configurationModel.helperTextValue,
                                              accessibility: configurationModel.accessibilityConfiguration)
            }
        }
    }
}
