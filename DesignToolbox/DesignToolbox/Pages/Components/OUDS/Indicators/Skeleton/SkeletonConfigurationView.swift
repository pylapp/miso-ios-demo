// Software: MISO iOS (demo app) (fork of MISO iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Skeleton Configuration Model

/// The model shared between `SkeletonPageConfiguration` view and `SkeletonPageComponent` view.
final class SkeletonConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var isAnimated: Bool {
        didSet { updateCode() }
    }

    @Published var securityMargin: Bool {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        isAnimated = true
        securityMargin = false
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    private var securityMarginPattern: String {
        securityMargin ? "securityMargin: true" : ""
    }

    override func updateCode() {
        code = """
        MISOSkeleton(\(securityMarginPattern))
        .showSkeleton(isVisible: true, isAnimated: \(isAnimated))
        """
    }
}

// MARK: - Skeleton Configuration View

struct SkeletonConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: SkeletonConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            MISOAlertMessage("app_components_skeleton_shape_details", status: .accent(image: nil))

            MISOSwitchItem("app_components_skeleton_securityMargin_tech",
                           isOn: $configurationModel.securityMargin)

            MISOSwitchItem("app_components_common_animated_tech",
                           isOn: $configurationModel.isAnimated)
        }
    }
}
