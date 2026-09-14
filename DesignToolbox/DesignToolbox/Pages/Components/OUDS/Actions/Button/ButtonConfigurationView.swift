// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Button Configuration Model

/// The model shared between `ButtonPageConfiguration` view and `ButtonPageComponent` view.
final class ButtonConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var layout: ButtonLayout {
        didSet { updateCode() }
    }

    @Published var flipIcon: Bool {
        didSet { updateCode() }
    }

    @Published var rawImage: Bool {
        didSet { updateCode() }
    }

    @Published var appearance: MISOButton.Appearance {
        didSet { updateCode() }
    }

    @Published var styleOption: ButtonStyle {
        didSet { updateCode() }
    }

    @Published var size: MISOButton.Size {
        didSet { updateCode() }
    }

    @Published var isFullWidth: Bool {
        didSet { updateCode() }
    }

    @Published var progressVariant: CircularProgressIndicatorConfigurationModel.Variant {
        didSet { updateCode() }
    }

    @Published var progressValue: Double {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        text = String(localized: "app_components_common_label_label")
        layout = .textOnly
        flipIcon = false
        rawImage = false
        appearance = .default
        styleOption = .default
        size = .default
        isFullWidth = false

        progressVariant = .indeterminate
        progressValue = 0.75

        super.init()
    }

    deinit {}

    // MARK: Computed style

    var style: MISOButton.Style {
        switch styleOption {
        case .default:
            .default
        case .loading:
            switch progressVariant {
            case .determinate:
                .loading(progress: progressValue)
            case .indeterminate:
                .loading(progress: nil)
            }
        }
    }

    // MARK: Component Configuration

    private var disableCodePattern: String {
        if case .default = styleOption {
            ".disabled(\(enabled ? "false" : "true"))"
        } else {
            ""
        }
    }

    private var layoutPattern: String {
        let imageModePattern = (rawImage ? ", renderingMode: .original" : "")
        let imageNamePattern = (rawImage ? Image.placeholderImageSample() : Image.defaultImageSample())
        return switch layout {
        case .textOnly:
            "text: \"\(text)\""
        case .iconOnly:
            "image: MISOImage(asset: \(imageNamePattern)\(flipIconPattern), accessibilityLabel: \"\(accessibilityLabelValue)\", \(imageModePattern))"
        case .textAndIcon:
            "text: \"\(text)\", image: MISOImage(asset: \(imageNamePattern)\(flipIconPattern)\(imageModePattern))"
        }
    }

    private var appearancePattern: String {
        ", appearance: \(appearance.technicalDescription)"
    }

    private var stylePattern: String {
        switch style {
        case .default:
            ", style: .default"
        case let .loading(progress):
            if let progress {
                ", style: .loading(\"progress: \(progress)\"))"
            } else {
                ", style: .loading()"
            }
        }
    }

    private var sizePattern: String {
        ", size: \(size.technicalDescription)"
    }

    private var coloredSurfaceCodeModifier: String {
        onColoredSurface ? ".coloredSurface(theme.colorModes.onBrandPrimary)" : ""
    }

    private var flipIconPattern: String {
        flipIcon ? ", flipped: true" : ""
    }

    private var isFullWidthPattern: String {
        isFullWidth ? ", isFullWidth: true" : ""
    }

    private var accessibilityLabelValue: String {
        "app_components_common_icon_a11y".localized()
    }

    override func updateCode() {
        code =
            """
            MISOButton(\(layoutPattern)\(appearancePattern)\(stylePattern)\(sizePattern)\(isFullWidthPattern)) {}
            \(disableCodePattern)
            \(coloredSurfaceCodeModifier)
            """
    }
}

// MARK: - Button Layout

enum ButtonLayout: DesignToolboxEnumLocalizedRepresentable {
    case textOnly, textAndIcon, iconOnly

    var wordingKey: String {
        switch self {
        case .textOnly:
            "app_components_common_textOnlyLayout_tech"
        case .textAndIcon:
            "app_components_common_textAndIconLayout_tech"
        case .iconOnly:
            "app_components_common_iconOnlyLayout_tech"
        }
    }
}

// MARK: Button style extension

enum ButtonStyle: DesignToolboxEnumRepresentable {
    case `default`, loading
}

// MARK: Button size extension

extension MISOButton.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOButton.Size] = [.default, .small]
}

// MARK: Button appearance extension

extension MISOButton.Appearance: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOButton.Appearance] = [.default, .strong, .brand, .minimal, .negative]
}

// MARK: - Button Configuration View

struct ButtonConfigurationView: View {

    @StateObject var configurationModel: ButtonConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                MISOSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)
                    .disabled(configurationModel.styleOption != .default)

                MISOSwitchItem("app_components_common_onColoredSurface_tech", isOn: $configurationModel.onColoredSurface)

                MISOChipPicker(title: "app_components_common_appearance_tech",
                               selection: $configurationModel.appearance,
                               chips: MISOButton.Appearance.chips)

                MISOChipPicker(title: "app_components_common_style_tech",
                               selection: $configurationModel.styleOption,
                               chips: ButtonStyle.chips)

                if configurationModel.styleOption == .loading {
                    MISOChipPicker(title: "app_components_progressIndicator_variant_tech",
                                   selection: $configurationModel.progressVariant,
                                   chips: CircularProgressIndicatorConfigurationModel.Variant.chips)

                    if configurationModel.progressVariant == .determinate {
                        DesignToolboxProgressControl(progress: $configurationModel.progressValue)
                    }
                }

                MISOChipPicker(title: "app_components_common_size_tech",
                               selection: $configurationModel.size,
                               chips: MISOButton.Size.chips)

                MISOChipPicker(title: "app_components_common_layout_tech",
                               selection: $configurationModel.layout,
                               chips: ButtonLayout.chips)

                MISOSwitchItem("app_components_button_fullWidth_tech", isOn: $configurationModel.isFullWidth)

                MISOSwitchItem("app_components_common_flipIcon_tech", isOn: $configurationModel.flipIcon)
                    .disabled(!(configurationModel.layout == .iconOnly || configurationModel.layout == .textAndIcon))

                MISOSwitchItem("app_components_common_rawImage_tech", isOn: $configurationModel.rawImage)
                    .disabled(!(configurationModel.layout == .iconOnly || configurationModel.layout == .textAndIcon))
            }

            if configurationModel.layout == .textAndIcon || configurationModel.layout == .textOnly {
                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
                }
            }
        }
    }
}
