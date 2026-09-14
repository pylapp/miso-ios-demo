// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - List Item Icon Configuration Model

open class ListItemIconConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    var itemSize: MISOListItemSize

    @Published var status: ListItemIconStatus {
        didSet { updateCode() }
    }

    @Published var size: MISOListItemIcon.Size {
        didSet { updateCode() }
    }

    @Published var bageOnNeutralIcon: Bool {
        didSet { updateCode() }
    }

    // MARK: Initializer

    init(itemSize: MISOListItemSize) {
        self.itemSize = itemSize

        status = .negative
        bageOnNeutralIcon = false
        size = .medium

        super.init()
    }

    deinit {}

    // MARK: Builder

    @MainActor
    func icon(for theme: MISOTheme) -> MISOListItemIcon {
        let status: MISOListItemIcon.IconStatus =
            switch status {
            case .neutral:
                .neutral(
                    asset: Image(
                        decorative: "ic_heart",
                        bundle: theme.resourcesBundle),
                    badge: bageOnNeutralIcon)
            case .info:
                .info
            case .warning:
                .warning
            case .negative:
                .negative
            case .positive:
                .positive
            }

        return MISOListItemIcon(status: status,
                                description: "app_components_listItem_icon_a11y".localized(),
                                size: size)
    }

    override func updateCode() {
        let imagePattern = "Image(decorative: \"ic_heart\")"
        let statusPattern =
            switch status {
            case .neutral:
                ".neutral(asset: \(imagePattern), badge: \(bageOnNeutralIcon))"
            case .info:
                ".info"
            case .warning:
                ".warning"
            case .negative:
                ".negative"
            case .positive:
                ".positive"
            }

        let sizePattern: String = size.technicalDescription
        let descriptionPattern = "app_components_listItem_icon_a11y".localized()

        code = ".init(status: \(statusPattern), description: \"\(descriptionPattern)\", size: \(sizePattern))"
    }
}

// MARK: - List Item Ico nConfiguration

struct ListItemIconConfiguration: View {

    @ObservedObject var configurationModel: ListItemIconConfigurationModel

    var body: some View {
        VStack(spacing: 0) {
            MISOChipPicker(title: "app_components_listItem_iconStatus_tech".localized(),
                           selection: $configurationModel.status,
                           chips: ListItemIconStatus.chips)

            if configurationModel.status == .neutral {
                MISOSwitchItem("app_components_listItem_iconBadge_label", isOn: $configurationModel.bageOnNeutralIcon)
            }

            if configurationModel.itemSize == .default {
                MISOChipPicker(title: "app_components_listItem_iconSize_tech".localized(),
                               selection: $configurationModel.size,
                               chips: MISOListItemIcon.Size.chips)
            }
        }
    }
}

// MARK: - List Item Icon Status

enum ListItemIconStatus: DesignToolboxEnumRepresentable {
    case neutral, info, warning, negative, positive
}

// MARK: - Extensions of MISOListItemIcon.Size

extension MISOListItemIcon.Size: @retroactive CaseIterable {}
extension MISOListItemIcon.Size: DesignToolboxEnumRepresentable {
    public static let allCases: [MISOListItemIcon.Size] = [.medium, .large]
}
