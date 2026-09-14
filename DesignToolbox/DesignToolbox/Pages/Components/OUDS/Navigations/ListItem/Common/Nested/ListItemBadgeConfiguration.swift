// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import Combine
import MISOSwiftUI
import SwiftUI

// MARK: - List Item Badge Configuration Model

open class ListItemBadgeConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    var standardModel: BadgeStandardConfigurationModel
    var countModel: BadgeCountConfigurationModel

    @Published var badgeTypeOption: ListItemBadgeType {
        didSet {
            defaultBadgeOptions()
            updateCode()
        }
    }

    // MARK: Initializer

    override init() {

        badgeTypeOption = .standard
        standardModel = .init()
        countModel = .init()

        super.init()

        defaultBadgeOptions()

        register(standardModel)
        register(countModel)
    }

    deinit {}

    // MARK: Builder

    private func defaultBadgeOptions() {
        standardModel.standardSize = .small
        standardModel.status = .negative
        countModel.countSize = .large
        countModel.status = .negative
    }

    @MainActor
    var badgeType: MISOListItemTrailing.BadgeType {
        switch badgeTypeOption {
        case .standard:
            .standard(.init(accessibilityLabel: "app_components_badge_hint_a11y".localized(),
                            status: standardModel.status,
                            size: standardModel.standardSize))
        case .count:
            .count(.init(countModel.count,
                         accessibilityLabel: code.count.description,
                         status: countModel.status,
                         size: countModel.countSize))
        }
    }

    override func updateCode() {
        code = switch badgeTypeOption {
        case .standard:
            ".standard(\(standardModel.code)))"
        case .count:
            ".count(\(countModel.code)))"
        }
    }
}

// MARK: - List Item Badge Configuration

struct ListItemBadgeConfiguration: View {

    @ObservedObject var configurationModel: ListItemBadgeConfigurationModel

    var body: some View {
        MISOChipPicker(title: "app_components_listItem_trailing_badgeType_tech".localized(),
                       selection: $configurationModel.badgeTypeOption,
                       chips: ListItemBadgeType.chips)

        switch configurationModel.badgeTypeOption {
        case .standard:
            MISOChipPicker(title: "app_components_common_size_tech",
                           selection: $configurationModel.standardModel.standardSize,
                           chips: MISOBadgeStandard.Size.chips)

            MISOChipPicker(title: "app_components_common_status_tech",
                           selection: $configurationModel.standardModel.status,
                           chips: MISOBadgeStandard.Status.chips)
        case .count:
            MISOChipPicker(title: "app_components_common_size_tech",
                           selection: $configurationModel.countModel.countSize,
                           chips: MISOBadgeCount.Size.chips)

            MISOChipPicker(title: "app_components_common_status_tech",
                           selection: $configurationModel.countModel.status,
                           chips: MISOBadgeStandard.Status.chips)
        }
    }
}

// MARK: - List Item Badge Type

enum ListItemBadgeType: DesignToolboxEnumRepresentable {
    case standard, count
}
