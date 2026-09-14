// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Tag page

struct TagPage: View {

    @StateObject private var configurationModel: TagConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: TagConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            TagDemo(configurationModel: configurationModel)
        } configurationView: {
            TagConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Tag Demo

struct TagDemo: View {

    @StateObject var configurationModel: TagConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        if configurationModel.isLoading {
            MISOTag(loadingLabel: configurationModel.label,
                    progress: configurationModel.progress,
                    shape: configurationModel.shape,
                    size: configurationModel.size)
        } else {
            MISOTag(label: configurationModel.label,
                    status: configurationModel.status(from: theme),
                    appearance: configurationModel.appearance,
                    shape: configurationModel.shape,
                    size: configurationModel.size)
                .disabled(!configurationModel.enabled)
        }
    }
}
