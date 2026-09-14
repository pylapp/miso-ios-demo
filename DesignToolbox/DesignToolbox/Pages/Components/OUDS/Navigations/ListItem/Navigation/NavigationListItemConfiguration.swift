// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Navigation List Item Configuration Model

final class NavigationListItemConfigurationModel: ListItemConfigurationModel {

    @Published var indicatorType: MISONavigationListItemIndicatorType {
        didSet { updateCode() }
    }

    override init() {
        indicatorType = .next
        super.init()
        componentInitCode = "MISONavigationListItem"
    }

    deinit {}
}

// MARK: - Navigation List Item Configuration

struct NavigationListItemConfiguration: View {

    @ObservedObject var configurationModel: NavigationListItemConfigurationModel

    var body: some View {
        VStack(spacing: 0) {
            ListItemConfiguration(configurationModel: configurationModel)

            Divider().horizontal()

            MISOChipPicker(title: "app_components_listItem_indicator_tech".localized(),
                           selection: $configurationModel.indicatorType,
                           chips: MISONavigationListItemIndicatorType.chips)
        }
    }
}

// MARK: Extension for MISONavigationListItemIndicatorType

extension MISONavigationListItemIndicatorType: @retroactive CaseIterable {}
extension MISONavigationListItemIndicatorType: DesignToolboxEnumRepresentable {
    public static let allCases: [MISONavigationListItemIndicatorType] = [.next, .external, .previous]
}
