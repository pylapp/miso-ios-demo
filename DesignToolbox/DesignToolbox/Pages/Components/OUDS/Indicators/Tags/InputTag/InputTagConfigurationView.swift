// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Input Tag Configuration Model

/// The model shared between `InputTagPageConfiguration` view and `InputTagPageComponent` view.
final class InputTagConfigurationModel: ComponentConfiguration {

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var label: String {
        didSet { updateCode() }
    }

    override init() {
        enabled = true
        label = String(localized: "app_components_common_label_label")
        super.init()
    }

    deinit {}

    override func updateCode() {
        code = """
        MISOInputTag(label: \"\(label)\") {}
        \(disabledPattern)
        """
    }

    private var disabledPattern: String {
        enabled ? "" : ".disabled(true)"
    }
}

// MARK: - InputTag Configuration View

struct InputTagConfigurationView: View {

    @StateObject var configurationModel: InputTagConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            MISOSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.label, label: "app_components_common_label_tech")
            }
        }
    }
}
