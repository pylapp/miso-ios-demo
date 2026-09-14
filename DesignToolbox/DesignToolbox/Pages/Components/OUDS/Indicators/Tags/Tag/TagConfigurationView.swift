// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Tag Configuration Model

/// The model shared between `TagPageConfiguration` view and `TagPageComponent` view.
final class TagConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var layout: TagLayout {
        didSet { updateCode() }
    }

    @Published var label: String {
        didSet { updateCode() }
    }

    @Published var size: MISOTag.Size {
        didSet { updateCode() }
    }

    @Published var statusCategory: MISOTag.Status.Category {
        didSet { updateCode() }
    }

    @Published var appearance: MISOTag.Appearance {
        didSet { updateCode() }
    }

    @Published var shape: MISOTag.Shape {
        didSet { updateCode() }
    }

    @Published var isLoading: Bool {
        didSet { updateCode() }
    }

    @Published var progressVariant: CircularProgressIndicatorConfigurationModel.Variant {
        didSet { updateCode() }
    }

    @Published var progressValue: Double {
        didSet { updateCode() }
    }

    @Published var flipIcon: Bool {
        didSet { updateCode() }
    }

    @Published var iconType: DefinedStatusIcons {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        layout = .textOnly
        flipIcon = false
        iconType = .tintedIcon
        label = String(localized: "app_components_common_label_label")

        isLoading = false
        progressVariant = .indeterminate
        progressValue = 0.75

        size = .default
        statusCategory = .neutral
        shape = .rounded
        appearance = .emphasized
        super.init()
    }

    deinit {}

    // MARK: Helpers

    var progress: Double? {
        switch progressVariant {
        case .determinate:
            progressValue
        case .indeterminate:
            nil
        }
    }

    @MainActor func status(from theme: MISOTheme) -> MISOTag.Status {
        let asset: Image = iconType == .tintedIcon
            ? Image.defaultImage(prefixedBy: theme.name)
            : Image.placeholderImage()
        let renderingMode: Image.TemplateRenderingMode = iconType == .tintedIcon ? .template : .original
        let iconImage = MISOImage(asset: asset, flipped: flipIcon, renderingMode: renderingMode)

        return switch statusCategory {
        case .accent:
            switch layout.statusLeading {
            case .bullet:
                .accent(bullet: true)
            case .none:
                .accent(bullet: false)
            case .icon:
                .accent(image: iconImage)
            }
        case .neutral:
            switch layout.statusLeading {
            case .bullet:
                .neutral(bullet: true)
            case .none:
                .neutral(bullet: false)
            case .icon:
                .neutral(image: iconImage)
            }
        case .positive:
            .positive(leading: layout.statusLeading)
        case .warning:
            .warning(leading: layout.statusLeading)
        case .negative:
            .negative(leading: layout.statusLeading)
        case .info:
            .info(leading: layout.statusLeading)
        }
    }

    var enableFlipIcon: Bool {
        !isLoading && (layout == .textAndIcon && (statusCategory == .accent || statusCategory == .neutral))
    }

    // MARK: Component Configuration

    override func updateCode() {
        if isLoading {
            code = "MISOTag(loadingLabel: \"\(label)\"\(progressPattern)\(shapePattern)\(sizePattern))"
        } else {
            code = """
            MISOTag(label: \"\(label)\"\(statusPattern)\(appearancePattern)\(shapePattern)\(sizePattern))
            \(disablePattern)
            """
        }
    }

    private var disablePattern: String {
        !isLoading && !enabled ? ".disabled(true)" : ""
    }

    private var progressPattern: String {
        guard isLoading else {
            return ""
        }
        return progressVariant == .indeterminate ? ", progress: nil" : ", progress: \(String(format: "%.2f", progressValue))"
    }

    private var appearancePattern: String {
        ", appearance: \(appearance.technicalDescription)"
    }

    private var iconAssetSample: String {
        iconType == .tintedIcon ? Image.defaultImageSample() : "Image(decorative: \"il_placeholder\")"
    }

    private var renderingModeCode: String {
        iconType == .image ? ", renderingMode: .original" : ""
    }

    private var statusPattern: String {
        if statusCategory != .neutral, statusCategory != .accent {
            return ", status: \(statusCategory.technicalDescription)(leading: \(layout.statusLeading.technicalDescription))"
        } else {
            if layout == .textAndBullet {
                return ", status: \(statusCategory.technicalDescription)(bullet: true)"
            } else if layout == .textAndIcon {
                let flipIconPattern = flipIcon ? ", flipped: true" : ""
                return ", status: \(statusCategory.technicalDescription)(image: MISOImage(asset: \(iconAssetSample)\(flipIconPattern)\(renderingModeCode)))"
            } else {
                return ", status: \(statusCategory.technicalDescription)()"
            }
        }
    }

    private var shapePattern: String {
        ", shape: \(shape.technicalDescription)"
    }

    private var sizePattern: String {
        ", size: \(size.technicalDescription)"
    }
}

// MARK: - Tag Configuration View

struct TagConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: TagConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            MISOSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)
                .disabled(configurationModel.isLoading)

            MISOSwitchItem("app_components_common_flipIcon_tech", isOn: $configurationModel.flipIcon)
                .disabled(!configurationModel.enableFlipIcon)

            MISOChipPicker(title: "app_components_common_layout_tech",
                           selection: $configurationModel.layout,
                           chips: TagLayout.chips)

            if configurationModel.layout == .textAndIcon,
               configurationModel.statusCategory == .neutral || configurationModel.statusCategory == .accent
            {
                MISOChipPicker(title: "app_components_common_statusIcon_tech",
                               selection: $configurationModel.iconType,
                               chips: DefinedStatusIcons.chips)
            }

            if !configurationModel.isLoading {
                MISOChipPicker(title: "app_components_common_appearance_tech",
                               selection: $configurationModel.appearance,
                               chips: MISOTag.Appearance.chips)

                MISOChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.statusCategory,
                               chips: filteredStatusChips)
            }

            MISOChipPicker(title: "app_components_tag_shape_tech",
                           selection: $configurationModel.shape,
                           chips: MISOTag.Shape.chips)

            MISOChipPicker(title: "app_components_common_size_tech",
                           selection: $configurationModel.size,
                           chips: MISOTag.Size.chips)

            MISOSwitchItem("app_components_common_loader_tech", isOn: $configurationModel.isLoading)
                .disabled(!configurationModel.enabled)

            if configurationModel.isLoading {
                MISOChipPicker(title: "app_components_progressIndicator_variant_tech",
                               selection: $configurationModel.progressVariant,
                               chips: CircularProgressIndicatorConfigurationModel.Variant.chips)

                if configurationModel.progressVariant == .determinate {
                    DesignToolboxProgressControl(progress: $configurationModel.progressValue)
                }
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.label, label: "app_components_common_label_tech")
            }
        }
    }

    private var filteredStatusChips: [MISOChipPickerData<MISOTag.Status.Category>] {
        MISOTag.Status.Category.allCases.compactMap(\.chipData)
    }
}

extension MISOTag.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOTag.Size] = [.default, .small]
}

extension MISOTag.Status.Leading: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOTag.Status.Leading] = [.none, .icon, .bullet]
}

extension MISOTag.Status.Category: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOTag.Status.Category] = [.neutral, .accent, .info, .negative, .positive, .warning]
}

extension MISOTag.Appearance: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOTag.Appearance] = [.emphasized, .muted]
}

extension MISOTag.Shape: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOTag.Shape] = [.rounded, .square]
}

enum TagLayout: DesignToolboxEnumLocalizedRepresentable {
    case textOnly, textAndBullet, textAndIcon

    var wordingKey: String {
        switch self {
        case .textOnly:
            "app_components_common_textOnlyLayout_tech"
        case .textAndBullet:
            "app_components_tag_textAndBulletLayout_tech"
        case .textAndIcon:
            "app_components_common_textAndIconLayout_tech"
        }
    }

    var statusLeading: MISOTag.Status.Leading {
        switch self {
        case .textOnly:
            .none
        case .textAndBullet:
            .bullet
        case .textAndIcon:
            .icon
        }
    }
}
