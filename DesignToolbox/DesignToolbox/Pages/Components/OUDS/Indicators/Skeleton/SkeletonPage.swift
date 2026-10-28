// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Skeleton page

struct SkeletonPage: View {

    @StateObject private var configurationModel: SkeletonConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: SkeletonConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            SkeletonDemo(configurationModel: configurationModel)
        } configurationView: {
            SkeletonConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Skeleton Demo

struct SkeletonDemo: View {

    @StateObject var configurationModel: SkeletonConfigurationModel

    var body: some View {
        MISOSkeleton(securityMargin: configurationModel.securityMargin)
            .frame(width: 200, height: 62, alignment: .center)
            .showSkeleton(isVisible: true, isAnimated: configurationModel.isAnimated)
    }
}
