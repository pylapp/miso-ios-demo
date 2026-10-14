// Software: MISO iOS (demo app) (fork of MISO iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Categorical Tag Page

struct CategoricalTagPage: View {

    @StateObject private var configurationModel: CategoricalTagConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: CategoricalTagConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            CategoricalTagDemo(configurationModel: configurationModel)
        } configurationView: {
            CategoricalTagConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Categorical Tag Demo

struct CategoricalTagDemo: View {

    @ObservedObject var configurationModel: CategoricalTagConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        tagView
            .disabled(!configurationModel.enabled && !configurationModel.isLoading)
    }

    @ViewBuilder
    private var tagView: some View {
        Group {
            if configurationModel.isLoading {
                MISOCategoricalTag(loadingLabel: configurationModel.label,
                                   progress: configurationModel.progress,
                                   category: configurationModel.category,
                                   shape: configurationModel.shape,
                                   size: configurationModel.size)
            } else {
                MISOCategoricalTag(label: configurationModel.label,
                                   category: configurationModel.category,
                                   leading: configurationModel.leading(from: theme),
                                   shape: configurationModel.shape,
                                   size: configurationModel.size)
            }
        }.showSkeleton(isVisible: configurationModel.showSkeleton)
    }
}
