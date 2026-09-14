// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Code Configuration Model

/// The model shared between `CodePage` and `CodeConfigurationView` views.
///
/// `MISOCode` only defines a single (medium) typography style, so the only configurable
/// parameter here is the text content itself.
final class CodeConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var text: String {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        text = String(localized: "app_components_common_label_label")
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code = """
        MISOCode(text: "\(text)")
        """
    }
}

// MARK: - Code Configuration View

struct CodeConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: CodeConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
            }
        }
    }
}
