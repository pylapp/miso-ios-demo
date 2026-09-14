// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Inline Alert Configuration Model

/// The model shared between `InlineAlertConfigurationView` view and `InlineAlertDemo` view.
final class InlineAlertConfigurationModel: AlertConfigurationModel {

    // MARK: Initializer

    override init() {
        super.init()
        status = .neutral
        statusIcon = .tintedIcon
        flipIcon = false
    }

    deinit {}

    // MARK: Component Code snippet

    override func updateCode() {
        code =
            """
            MISOInlineAlert(label: \"\(text)\"\(statusPattern))
            """
    }
}

// MARK: - Inline Alert Configuration View

struct InlineAlertConfigurationView: View {

    // MARK: Properties

    @StateObject var configurationModel: InlineAlertConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {

                MISOChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.status,
                               chips: AlertStatus.chips)

                MISOChipPicker(title: "app_components_common_statusIcon_tech",
                               selection: $configurationModel.statusIcon,
                               chips: StatusIcons.chips)
                    .disabled(!configurationModel.hasIcon)

                MISOSwitchItem("app_components_common_flipIcon_tech", isOn: $configurationModel.flipIcon)
                    .disabled(!configurationModel.enableFlipIcon)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
            }
        }
    }
}
