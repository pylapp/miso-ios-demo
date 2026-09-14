// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Display Configuration Model

/// The model shared between `DisplayPage` and `DisplayConfigurationView` views.
final class DisplayConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var size: MISODisplay.Size {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        text = String(localized: "app_components_common_label_label")
        size = .large
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    private var sizePattern: String {
        "size: \(size.technicalDescription)"
    }

    override func updateCode() {
        code = """
        MISODisplay(text: "\(text)", \(sizePattern))
        """
    }
}

// MARK: - Display Configuration View

struct DisplayConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: DisplayConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                MISOChipPicker(title: "app_components_common_size_tech",
                               selection: $configurationModel.size,
                               chips: MISODisplay.Size.chips)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
            }
        }
    }
}

// MARK: - Display Size extension

extension MISODisplay.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISODisplay.Size] = [.large, .medium, .small]
}
