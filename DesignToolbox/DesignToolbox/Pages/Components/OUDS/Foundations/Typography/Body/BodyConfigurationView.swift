// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Body Configuration Model

/// The model shared between `BodyPage` and `BodyConfigurationView` views.
final class BodyConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var size: MISOBody.Size {
        didSet { updateCode() }
    }

    @Published var weight: MISOBody.Weight {
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
        MISOBody(text: "\(text)", \(sizePattern), \(weightPattern))
        """
    }
}

// MARK: - Body Configuration View

struct BodyConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: BodyConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                MISOChipPicker(title: "app_components_common_size_tech",
                               selection: $configurationModel.size,
                               chips: MISOBody.Size.chips)

                MISOChipPicker(title: "app_components_common_weight_tech",
                               selection: $configurationModel.weight,
                               chips: MISOBody.Weight.chips)
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
            }
        }
    }
}

// MARK: - Body Size extension

extension MISOBody.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOBody.Size] = [.large, .medium, .small]
}

// MARK: - Body Weight extension

extension MISOBody.Weight: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOBody.Weight] = [.default, .moderate, .strong]
}
