// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import Combine
import MISOSwiftUI
import SwiftUI

// MARK: - List Item Leading Configuration Model

open class ListItemLeadingConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    @Published var option: ListItemLeadingType {
        didSet { updateCode() }
    }

    var itemSize: MISOListItemSize {
        didSet {
            avatarModel.itemSize = itemSize
            iconModel.itemSize = itemSize
            imageModel.itemSize = itemSize
        }
    }

    var avatarModel: ListItemAvatarConfigurationModel
    var flagModel: ListItemFlagConfigurationModel
    var iconModel: ListItemIconConfigurationModel
    var imageModel: ListItemImageConfigurationModel

    // MARK: Initializer

    init(itemSize: MISOListItemSize) {
        self.itemSize = itemSize

        option = .none

        avatarModel = ListItemAvatarConfigurationModel(itemSize: itemSize)
        flagModel = ListItemFlagConfigurationModel()
        iconModel = ListItemIconConfigurationModel(itemSize: itemSize)
        imageModel = ListItemImageConfigurationModel(itemSize: itemSize)

        super.init()

        register(avatarModel)
        register(flagModel)
        register(iconModel)
        register(imageModel)
    }

    deinit {}

    // MARK: Builder

    @MainActor
    func item(for theme: MISOTheme) -> MISOListItemLeading? {
        switch option {
        case .none:
            nil
        case .icon:
            .icon(iconModel.icon(for: theme))
        case .image:
            .image(imageModel.image(for: theme))
        case .flag:
            .flag(flagModel.flag)
        case .avatar:
            .avatar(avatarModel.avatar(for: theme))
        case .slot:
            .slot(AnyView(
                ZStack {
                    MISOCircularProgressIndicator(
                        progress: 1.0,
                        status: .positive,
                        track: false,
                        animated: false)
                    Image(systemName: "checkmark")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.green)
                }
                .frame(width: 48, height: 48)))
        }
    }

    // MARK: Media helper

    var needRoundedMediaOption: Bool {
        option == .image
    }

    // MARK: Code helper

    override func updateCode() {
        let pattern =
            switch option {
            case .none:
                ""
            case .icon:
                ".icon(\(iconModel.code)"
            case .image:
                ".image(\(imageModel.code))"
            case .flag:
                ".flag(\(flagModel.code))"
            case .avatar:
                ".avatar(\(avatarModel.code))"
            case .slot:
                """
                .slot(AnyView(
                    ...
                ))
                """
            }

        code = option == .none ? "" : "\n\nlet leading: MISOListItemLeading = \n \(pattern)"
    }
}

// MARK: - List Item Leading Configuration

struct ListItemLeadingConfiguration: View {

    @ObservedObject var configurationModel: ListItemLeadingConfigurationModel

    var body: some View {
        VStack(spacing: 0) {
            MISOChipPicker(title: "",
                           selection: $configurationModel.option,
                           chips: ListItemLeadingType.chips)

            switch configurationModel.option {
            case .image:
                ListItemImageConfiguration(configurationModel: configurationModel.imageModel)
            case .avatar:
                ListItemAvatarConfiguration(configurationModel: configurationModel.avatarModel)
            case .icon:
                ListItemIconConfiguration(configurationModel: configurationModel.iconModel)
            case .flag:
                EmptyView()
            case .none:
                EmptyView()
            case .slot:
                EmptyView()
            }
        }
    }
}

// MARK: - List Item Leading Type

enum ListItemLeadingType: DesignToolboxEnumRepresentable {
    case none, icon, image, flag, avatar, slot
}
