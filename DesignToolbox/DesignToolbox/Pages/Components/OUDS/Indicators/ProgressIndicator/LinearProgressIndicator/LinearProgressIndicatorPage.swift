// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOComponents
import MISOSwiftUI
import SwiftUI

// MARK: - Linear Progress Indicator Page

struct LinearProgressIndicatorPage: View {

    @StateObject private var configurationModel: LinearProgressIndicatorConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: LinearProgressIndicatorConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            LinearProgressIndicatorDemo(configurationModel: configurationModel)
        } configurationView: {
            LinearProgressIndicatorConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Linear Progress Indicator Demo

struct LinearProgressIndicatorDemo: View {

    @StateObject var configurationModel: LinearProgressIndicatorConfigurationModel

    var body: some View {
        Group {
            switch configurationModel.variant {
            case .determinate:
                MISOLinearProgressIndicator(progress: configurationModel.progress,
                                            status: configurationModel.status,
                                            track: configurationModel.track,
                                            stopIndicator: configurationModel.stopIndicator,
                                            helperText: configurationModel.determinateHelperTextValue,
                                            gapSize: configurationModel.gapSize,
                                            animated: configurationModel.animated,
                                            accessibility: configurationModel.accessibilityConfiguration)
            case .indeterminate:
                MISOLinearProgressIndicator(status: configurationModel.status,
                                            track: configurationModel.track,
                                            helperText: configurationModel.helperTextValue,
                                            helperTextAlignment: configurationModel.helperTextAlignment,
                                            gapSize: configurationModel.gapSize,
                                            accessibility: configurationModel.accessibilityConfiguration)
            }
        }
    }
}
