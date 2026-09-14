// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Switch Configuration Model

/// The model shared between `SwitchConfiguration` view and `SwitchPage` view.
final class SwitchConfigurationModel: ComponentConfiguration {

    // MARK: - Properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var isReadOnly: Bool {
        didSet { updateCode() }
    }

    @Published var selection: Bool {
        didSet { updateCode() }
    }

    // MARK: - Initializer

    override init() {
        selection = true
        enabled = true
        isReadOnly = false
        super.init()
    }

    deinit {}

    // MARK: - Component Configuration

    override func updateCode() {
        code =
            """
            MISOSwitch(isOn: $isOn, accessibilityLabel: "A label for accessibility"\(isReadOnlyPattern))
            \(disableCodePattern)
            """
    }

    private var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var isReadOnlyPattern: String {
        isReadOnly ? ", isReadOnly: true" : ""
    }
}

// MARK: - Switch Configuration View

struct SwitchConfiguration: View {

    @ObservedObject var configurationModel: SwitchConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            MISOSwitchItem("app_components_common_selection_tech", isOn: $configurationModel.selection)
                .disabled(!configurationModel.enabled || configurationModel.isReadOnly)

            MISOSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)
                .disabled(configurationModel.isReadOnly)

            MISOSwitchItem("app_components_common_readOnly_tech", isOn: $configurationModel.isReadOnly)
                .disabled(!configurationModel.enabled)
        }
    }
}
