// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Badge Icon Configuration Model

/// The model shared between `BadgePageConfiguration` view and `BadgePageComponent` view.
final class BadgeIconConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var size: MISOBadgeStandard.Size {
        didSet { updateCode() }
    }

    @Published var statusKind: BadgeIconStatusKind {
        didSet {
            if !enableFlipIcon {
                flipIcon = false
            }
            updateCode()
        }
    }

    @Published var flipIcon: Bool {
        didSet {
            guard oldValue != flipIcon else { return }
            updateCode()
        }
    }

    @Published var statusIcon: DefinedStatusIcons {
        didSet { updateCode() }
    }

    // MARK: - Properties

    var enableFlipIcon: Bool {
        statusKind == .neutral || statusKind == .accent
    }

    @MainActor func statusWithIcon(from theme: MISOTheme) -> MISOBadgeIcon.Status {
        let imageRenderingMode: Image.TemplateRenderingMode = (statusIcon == .tintedIcon ? .template : .original)
        let imageAsset: Image = (statusIcon == .tintedIcon ? Image.defaultImage(prefixedBy: theme.name) : Image.placeholderImage())
        return switch statusKind {
        case .neutral:
            .neutral(image: MISOImage(asset: imageAsset, flipped: flipIcon, renderingMode: imageRenderingMode))
        case .accent:
            .accent(image: MISOImage(asset: imageAsset, flipped: flipIcon, renderingMode: imageRenderingMode))
        case .positive:
            .positive
        case .info:
            .info
        case .warning:
            .warning
        case .negative:
            .negative
        }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        size = .medium
        statusKind = .neutral
        flipIcon = false
        statusIcon = .tintedIcon
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code = """
        MISOBadgeIcon(\(statusWithIconPattern), accessibilityLabel: someLabel, \(sizePattern))
        \(disablePattern)
        """
    }

    private var disablePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    var statusWithIconPattern: String {
        switch statusKind {
        case .neutral:
            switch statusIcon {
            case .image:
                "status: .neutral(image: MISOImage(asset: \(Image.defaultImageSample())\(flipIcon ? ", flipped: true" : ""))"
            case .tintedIcon:
                "status: .neutral(image: MISOImage(asset: \(Image.placeholderImageSample())\(flipIcon ? ", flipped: true" : ""), renderingMode: .original)"
            }
        case .accent:
            switch statusIcon {
            case .image:
                "status: .accent(image: MISOImage(asset: \(Image.defaultImageSample())\(flipIcon ? ", flipped: true" : ""))"
            case .tintedIcon:
                "status: .accent(image: MISOImage(asset: \(Image.placeholderImageSample())\(flipIcon ? ", flipped: true" : ""), renderingMode: .original)"
            }
        case .positive:
            "status: .positive"
        case .info:
            "status: .info"
        case .warning:
            "status: .warning"
        case .negative:
            "status: .negative"
        }
    }

    private var sizePattern: String {
        "size: \(size.technicalDescription)"
    }
}

// MARK: - Badge Icon Configuration View

struct BadgeIconConfigurationView: View {

    // MARK: Stored properties

    @ObservedObject var configurationModel: BadgeIconConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            MISOSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

            MISOChipPicker(title: "app_components_common_statusIcon_tech",
                           selection: $configurationModel.statusIcon,
                           chips: DefinedStatusIcons.chips)

            MISOSwitchItem("app_components_common_flipIcon_tech", isOn: $configurationModel.flipIcon)
                .disabled(!configurationModel.enableFlipIcon)

            MISOChipPicker(title: "app_components_common_size_tech",
                           selection: $configurationModel.size,
                           chips: MISOBadgeStandard.Size.chips)

            MISOChipPicker(title: "app_components_common_status_tech",
                           selection: $configurationModel.statusKind,
                           chips: BadgeIconStatusKind.chips)
        }
    }
}

// MARK: - Badge Icon Status Kind

enum BadgeIconStatusKind: DesignToolboxEnumRepresentable, CaseIterable, Hashable {
    case neutral, accent, positive, info, warning, negative
}
