// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Label Configuration Model

/// The model shared between `LabelPage` and `LabelConfigurationView` views.
final class LabelConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var size: MISOLabel.Size {
        didSet { updateCode() }
    }

    @Published var weight: MISOLabel.Weight {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        text = String(localized: "app_components_common_label_label")
        size = .medium
        weight = .default
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    private var sizePattern: String {
        "size: \(size.technicalDescription)"
    }

    private var weightPattern: String {
        "weight: \(weight.technicalDescription)"
    }

    override func updateCode() {
        code = """
        MISOLabel(text: "\(text)", \(sizePattern), \(weightPattern))
        """
    }
}

// MARK: - Label Configuration View

struct LabelConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: LabelConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                MISOChipPicker(title: "app_components_common_size_tech",
                               selection: $configurationModel.size,
                               chips: MISOLabel.Size.chips)

                MISOChipPicker(title: "app_components_common_weight_tech",
                               selection: $configurationModel.weight,
                               chips: MISOLabel.Weight.chips)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
            }
        }
    }
}

// MARK: - Label Size extension

extension MISOLabel.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOLabel.Size] = [.xLarge, .large, .medium, .small]
}

// MARK: - Label Weight extension

extension MISOLabel.Weight: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOLabel.Weight] = [.default, .moderate, .strong]
}
