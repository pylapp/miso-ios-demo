// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - SuggestionChip Configuration Model

/// The model shared between `SuggestionChipPageConfiguration` view and `SuggestionChipPageComponent` view.
final class SuggestionChipConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var layout: ChipLayout {
        didSet { updateCode() }
    }

    @Published var iconType: DefinedStatusIcons {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        text = "app_components_chip_suggestionChip_chipContent_label".localized()
        layout = .textOnly
        iconType = .tintedIcon
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    private var disabledCode: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var accessibilityLabelValue: String {
        "app_components_common_icon_a11y".localized()
    }

    private var iconAssetName: String {
        iconType == .tintedIcon ? "ic_heart" : "il_placeholder"
    }

    private var renderingModeCode: String {
        iconType == .image ? ", renderingMode: .original" : ""
    }

    override func updateCode() {
        switch layout {
        case .textOnly:
            code =
                """
                MISOSuggestionChip(text: \"\(text)\") {}
                \(disabledCode)
                """
        case .iconOnly:
            code =
                """
                MISOSuggestionChip(image: MISOImage(asset: Image(\"\(iconAssetName)\")\(renderingModeCode)), accessibilityLabel: \"\(accessibilityLabelValue)\") {}
                \(disabledCode)
                """
        case .textAndIcon:
            code =
                """
                MISOSuggestionChip(image: MISOImage(asset: Image(\"\(iconAssetName)\")\(renderingModeCode)), text: \"\(text)\") {}
                \(disabledCode)
                """
        }
    }
}

// MARK: - SuggestionChip Configuration View

struct SuggestionChipConfigurationView: View {

    @StateObject var configurationModel: SuggestionChipConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                MISOSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

                MISOChipPicker(title: "app_components_common_layout_tech",
                               selection: $configurationModel.layout,
                               chips: ChipLayout.chips)

                if configurationModel.layout != .textOnly {
                    MISOChipPicker(title: "app_components_common_statusIcon_tech",
                                   selection: $configurationModel.iconType,
                                   chips: DefinedStatusIcons.chips)
                }
            }

            if configurationModel.layout == .textAndIcon || configurationModel.layout == .textOnly {
                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
                }
            }
        }
    }
}
