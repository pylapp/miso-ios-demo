// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Checkbox Configuration Model

/// The model shared between `CheckboxConfiguration` view and `CheckboxPage` view.
/// Related to `MISOCheckbox` (i.e. with 2 available values).
final class CheckboxConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var indicatorState: Bool {
        didSet { updateCode() }
    }

    @Published var isError: Bool {
        didSet { updateCode() }
    }

    @Published var isReadOnly: Bool {
        didSet { updateCode() }
    }

    var accessibilityLabel: String {
        (isError ? "app_components_common_error_a11y" : "app_components_checkbox_hint_a11y")
            .localized()
    }

    // MARK: Initializer

    override init() {
        enabled = true
        indicatorState = true
        isError = false
        isReadOnly = false
        enabled = true
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code =
            """
            MISOCheckbox(isOn: $isOn\(isErrorPattern)\(isReadOnlyPattern))
            \(disableCodePattern)
            """
    }

    private var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var isErrorPattern: String {
        if isError, enabled {
            ", isError: true"
        } else {
            ""
        }
    }

    private var isReadOnlyPattern: String {
        isReadOnly ? ", isReadOnly: true" : ""
    }
}

// MARK: - Checkbox Configuration View

struct CheckboxConfiguration: View {

    @ObservedObject var configurationModel: CheckboxConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            MISOSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)
                .disabled(configurationModel.isReadOnly || configurationModel.isError)

            MISOSwitchItem("app_components_common_readOnly_tech", isOn: $configurationModel.isReadOnly)
                .disabled(!configurationModel.enabled || configurationModel.isError)

            MISOSwitchItem("app_components_common_error_tech", isOn: $configurationModel.isError)
                .disabled(!configurationModel.enabled || configurationModel.isReadOnly)

            MISOSwitchItem("app_components_common_selection_tech", isOn: $configurationModel.indicatorState)
                .disabled(!configurationModel.enabled || configurationModel.isReadOnly)
        }
    }
}
