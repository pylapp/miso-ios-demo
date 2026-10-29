// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Categorical Tag Layout

enum CategoricalTagLayout: DesignToolboxEnumLocalizedRepresentable, CaseIterable {
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
}

// MARK: - Categorical Tag Configuration Model

final class CategoricalTagConfigurationModel: ComponentConfiguration {

    @Published var showSkeleton: Bool {
        didSet { updateCode() }
    }

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var label: String {
        didSet { updateCode() }
    }

    @Published var category: MISOCategoricalTag.Category {
        didSet { updateCode() }
    }

    @Published var layout: CategoricalTagLayout {
        didSet { updateCode() }
    }

    @Published var flipIcon: Bool {
        didSet { updateCode() }
    }

    @Published var iconType: DefinedStatusIcons {
        didSet { updateCode() }
    }

    @Published var shape: MISOTag.Shape {
        didSet { updateCode() }
    }

    @Published var size: MISOTag.Size {
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

    override init() {
        showSkeleton = false
        enabled = true
        label = String(localized: "app_components_common_label_label")
        category = .category1
        layout = .textOnly
        flipIcon = false
        iconType = .tintedIcon
        shape = .rounded
        size = .default

        isLoading = false
        progressVariant = .indeterminate
        progressValue = 0.75

        super.init()
    }

    deinit {}

    var progress: Double? {
        switch progressVariant {
        case .determinate:
            progressValue
        case .indeterminate:
            nil
        }
    }

    var enableFlipIcon: Bool {
        !isLoading && layout == .textAndIcon
    }

    @MainActor func leading(from theme: MISOTheme) -> MISOCategoricalTag.Leading {
        switch layout {
        case .textOnly:
            return .none
        case .textAndBullet:
            return .bullet
        case .textAndIcon:
            let asset: Image = iconType == .tintedIcon
                ? Image.defaultImage(prefixedBy: theme.name)
                : Image.placeholderImage()
            let renderingMode: Image.TemplateRenderingMode = iconType == .tintedIcon ? .template : .original
            return .icon(MISOImage(asset: asset, flipped: flipIcon, renderingMode: renderingMode))
        }
    }

    // swiftlint:disable line_length
    override func updateCode() {
        if isLoading {
            code = """
            MISOCategoricalTag(loadingLabel: \"\(label)\"\(progressPattern)\(categoryPattern)\(shapePattern)\(sizePattern))
            \(skeletonPattern)
            """
        } else {
            code = """
            MISOCategoricalTag(label: "\(label)", category: \(category.technicalDescription), leading: \(leadingPattern), shape: \(shape.technicalDescription), size: \(size.technicalDescription))
            \(skeletonPattern)
            \(disablePattern)
            """
        }
    }

    // swiftlint:enable line_length

    private var skeletonPattern: String {
        showSkeleton ? ".showSkeleton(isVisible: true)" : ""
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

    private var categoryPattern: String {
        ", category: \(category.technicalDescription)"
    }

    private var shapePattern: String {
        ", shape: \(shape.technicalDescription)"
    }

    private var sizePattern: String {
        ", size: \(size.technicalDescription)"
    }

    private var leadingPattern: String {
        switch layout {
        case .textOnly:
            return ".none"
        case .textAndBullet:
            return ".bullet"
        case .textAndIcon:
            let iconAssetSample = iconType == .tintedIcon ? Image.defaultImageSample() : "Image(decorative: \"il_placeholder\")"
            let flipIconPattern = flipIcon ? ", flipped: true" : ""
            let renderingModeCode = iconType == .image ? ", renderingMode: .original" : ""
            return ".icon(MISOImage(asset: \(iconAssetSample)\(flipIconPattern)\(renderingModeCode)))"
        }
    }
}

// MARK: - Categorical Tag Configuration View

struct CategoricalTagConfigurationView: View {

    @ObservedObject var configurationModel: CategoricalTagConfigurationModel
    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            MISOSwitchItem("app_components_common_skeleton_tech", isOn: $configurationModel.showSkeleton)

            MISOSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)
                .disabled(configurationModel.isLoading)

            MISOSwitchItem("app_components_common_flipIcon_tech", isOn: $configurationModel.flipIcon)
                .disabled(!configurationModel.enableFlipIcon)

            MISOChipPicker(title: "app_components_common_category_tech",
                           selection: $configurationModel.category,
                           chips: MISOCategoricalTag.Category.chips)

            MISOChipPicker(title: "app_components_common_layout_tech",
                           selection: $configurationModel.layout,
                           chips: CategoricalTagLayout.chips)

            if configurationModel.layout == .textAndIcon {
                MISOChipPicker(title: "app_components_common_statusIcon_tech",
                               selection: $configurationModel.iconType,
                               chips: DefinedStatusIcons.chips)
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
}

// MARK: - MISOCategoricalTag.Category DesignToolboxEnumRepresentable

extension MISOCategoricalTag.Category: DesignToolboxEnumRepresentable {}
