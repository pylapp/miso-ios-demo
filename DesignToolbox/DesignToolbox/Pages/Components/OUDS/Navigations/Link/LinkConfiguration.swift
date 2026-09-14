// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Link Configuration Model

/// The model shared between `LinkPageConfiguration` view and `LinkPageComponent` view.
final class LinkConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool = true {
        didSet { updateCode() }
    }

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var layout: LinkLayout {
        didSet { updateCode() }
    }

    @Published var size: MISOLink.Size {
        didSet { updateCode() }
    }

    @Published var density: MISOLink.Density {
        didSet { updateCode() }
    }

    @Published var iconType: DefinedStatusIcons {
        didSet { updateCode() }
    }

    @Published var isFullWidth: Bool = false {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        text = String(localized: "app_components_link_tech")
        layout = .textOnly
        size = .default
        density = .default
        iconType = .tintedIcon
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    private var coloredSurfaceCodeModifierPattern: String {
        onColoredSurface ? ".coloredSurface(theme.colorModes.onBrandPrimary)" : ""
    }

    private var iconAssetSample: String {
        iconType == .tintedIcon ? "Image(\"ic_heart\")" : "Image(decorative: \"il_placeholder\")"
    }

    private var renderingModeCode: String {
        iconType == .image ? ", renderingMode: .original" : ""
    }

    private var disableCodePattern: String {
        enabled ? "" : ".disabled(true)"
    }

    private var densityPattern: String {
        density != .default ? ", density: \(density.technicalDescription)" : ""
    }

    private var isFullWidthPattern: String {
        isFullWidth ? ", isFullWidth: true" : ""
    }

    override func updateCode() {
        switch layout {
        case .textOnly:
            code =
                """
                MISOLink(text: \"\(text)\", size: \(size.technicalDescription)\(densityPattern)) {}
                \(disableCodePattern)
                \(coloredSurfaceCodeModifierPattern)
                """
        case .textAndIcon:
            code =
                """
                MISOLink(text: \"\(text)\", image: MISOImage(asset: \(iconAssetSample)\(renderingModeCode)), size: \(size.technicalDescription)\(densityPattern)) {}
                \(disableCodePattern)
                \(coloredSurfaceCodeModifierPattern)
                """
        case .indicatorNext:
            code =
                """
                MISOLink(text: \"\(text)\", indicator: .next, size: \(size.technicalDescription)\(densityPattern)\(isFullWidthPattern)) {}
                \(disableCodePattern)
                \(coloredSurfaceCodeModifierPattern)
                """
        case .indicatorPrevious:
            code =
                """
                MISOLink(text: \"\(text)\", indicator: .previous, size: \(size.technicalDescription)\(densityPattern)\(isFullWidthPattern)) {}
                \(disableCodePattern)
                \(coloredSurfaceCodeModifierPattern)
                """
        case .indicatorExternal:
            code =
                """
                MISOLink(text: \"\(text)\", indicator: .external, size: \(size.technicalDescription)\(densityPattern)\(isFullWidthPattern)) {}
                \(disableCodePattern)
                \(coloredSurfaceCodeModifierPattern)
                """
        }
    }
}

// MARK: - Link Layout

enum LinkLayout: DesignToolboxEnumLocalizedRepresentable {
    case textOnly, textAndIcon, indicatorPrevious, indicatorNext, indicatorExternal

    var wordingKey: String {
        switch self {
        case .textOnly:
            "app_components_common_textOnlyLayout_tech"
        case .textAndIcon:
            "app_components_common_textAndIconLayout_tech"
        case .indicatorPrevious:
            "app_components_link_backLayout_tech"
        case .indicatorNext:
            "app_components_link_nextLayout_tech"
        case .indicatorExternal:
            "app_components_link_externalLayout_tech"
        }
    }
}

// MARK: Link size extension

extension MISOLink.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOLink.Size] = [.default, .small]
}

// MARK: Link density extension

extension MISOLink.Density: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOLink.Density] = [.default, .compact]
}

// MARK: - Link Configuration View

struct LinkConfiguration: View {

    // MARK: Stored properties

    @StateObject var configurationModel: LinkConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                MISOSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

                MISOSwitchItem("app_components_common_onColoredSurface_tech", isOn: $configurationModel.onColoredSurface)

                MISOChipPicker(title: "app_components_common_size_tech",
                               selection: $configurationModel.size,
                               chips: MISOLink.Size.chips)

                MISOChipPicker(title: "app_components_common_density_tech",
                               selection: $configurationModel.density,
                               chips: MISOLink.Density.chips)

                MISOChipPicker(title: "app_components_common_layout_tech",
                               selection: $configurationModel.layout,
                               chips: LinkLayout.chips)

                if configurationModel.layout == .textAndIcon {
                    MISOChipPicker(title: "app_components_common_statusIcon_tech",
                                   selection: $configurationModel.iconType,
                                   chips: DefinedStatusIcons.chips)
                }

                if configurationModel.layout == .indicatorPrevious || configurationModel.layout == .indicatorNext {
                    MISOSwitchItem("app_components_link_fullWidth_tech", isOn: $configurationModel.isFullWidth)
                }
            }

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
            }
        }
    }
}
