// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - List Ite mAvatar Configuration Model

open class ListItemAvatarConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    var itemSize: MISOListItemSize

    @Published var type: ListItemAvatarType {
        didSet { updateCode() }
    }

    @Published var size: MISOListItemAvatar.Size {
        didSet { updateCode() }
    }

    @Published var badgeOption: ListItemAvatardBadge {
        didSet { updateCode() }
    }

    var standardBadgeModel: BadgeStandardConfigurationModel
    var iconBadgeModel: BadgeIconConfigurationModel

    // MARK: Initializer

    init(itemSize: MISOListItemSize) {
        self.itemSize = itemSize

        type = .icon
        size = .medium
        badgeOption = .none
        standardBadgeModel = BadgeStandardConfigurationModel()
        iconBadgeModel = BadgeIconConfigurationModel()

        super.init()

        register(standardBadgeModel)
        register(iconBadgeModel)
    }

    deinit {}

    // MARK: Builder

    private var badgePattern: String {
        switch badgeOption {
        case .none:
            ""
        case .standard:
            ", badgeType: .standard(\(standardBadgeModel.statusPattern))"
        case .icon:
            ", badgeType: .icon(\(iconBadgeModel.statusWithIconPattern))"
        }
    }

    @MainActor
    func avatar(for theme: MISOTheme) -> MISOListItemAvatar {
        let avatarType: MISOListItemAvatar.AvatarType =
            switch type {
            case .image:
                .image(Image.decorativeImage(named: "il_placeholder_avatar", prefixedBy: theme.name))
            case .initials:
                .initials("MT")
            case .icon:
                .icon
            }

        return MISOListItemAvatar(
            type: avatarType,
            size: size,
            badgeType: badgeType(for: theme),
            accessibilityLabel: "app_components_listItem_avatar_a11y".localized())
    }

    @MainActor
    private func badgeType(for theme: MISOTheme) -> MISOListItemAvatar.BadgeType? {
        switch badgeOption {
        case .none:
            nil
        case .standard:
            MISOListItemAvatar.BadgeType.standard(standardBadgeModel.status, accessibilityLabel: "app_components_badge_hint_a11y".localized())
        case .icon:
            MISOListItemAvatar.BadgeType.icon(iconBadgeModel.statusWithIcon(from: theme))
        }
    }

    override func updateCode() {
        let imagePattern = "Image(decorative: \"ic_placeholder\")"
        let typePattern = switch type {
        case .image:
            ".image(asset: \(imagePattern))"
        case .initials:
            ".initials(\"MT\")"
        case .icon:
            ".icon"
        }

        code = ".init(type: \(typePattern), size: \(size.technicalDescription)\(badgePattern))"
    }
}

// MARK: - List Item Avatar Configuration

struct ListItemAvatarConfiguration: View {

    @ObservedObject var configurationModel: ListItemAvatarConfigurationModel

    var body: some View {
        VStack(spacing: 0) {
            MISOChipPicker(title: "app_components_listItem_avatarType_tech".localized(),
                           selection: $configurationModel.type,
                           chips: ListItemAvatarType.chips)

            if configurationModel.itemSize == .default {
                MISOChipPicker(title: "app_components_listItem_avatarSize_tech".localized(),
                               selection: $configurationModel.size,
                               chips: MISOListItemAvatar.Size.chips)
            }

            MISOChipPicker(title: "app_components_listItem_avatarBadge_label".localized(),
                           selection: $configurationModel.badgeOption,
                           chips: ListItemAvatardBadge.chips)

            switch configurationModel.badgeOption {
            case .none:
                EmptyView()
            case .standard:
                MISOChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.standardBadgeModel.status,
                               chips: MISOBadgeStandard.Status.chips)
            case .icon:
                MISOChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.iconBadgeModel.statusKind,
                               chips: BadgeIconStatusKind.chips)
            }
        }
    }
}

// MARK: - List Item Avatar Type

enum ListItemAvatarType: DesignToolboxEnumRepresentable {
    case image, initials, icon
}

// MARK: - Extensions of MISOListItemAvatar.Size

extension MISOListItemAvatar.Size: @retroactive CaseIterable {}
extension MISOListItemAvatar.Size: DesignToolboxEnumRepresentable {
    public static let allCases: [MISOListItemAvatar.Size] = [
        .medium, .large, .extraLarge,
    ]
}

// MARK: - List Item Badge Type

enum ListItemAvatardBadge: DesignToolboxEnumRepresentable {
    case none, standard, icon
}
