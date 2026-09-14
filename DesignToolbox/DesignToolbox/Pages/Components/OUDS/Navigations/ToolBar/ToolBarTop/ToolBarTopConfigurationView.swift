// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

// MARK: - ToolBarTop Configuration Model

/// The model shared between `ToolBarTopPageConfiguration` view and `ToolBarTopPageComponent` view.
final class ToolBarTopConfigurationModel: ToolBarConfigurationModel {

    // MARK: Properties

    @Published var demoOption: DemoOption {
        didSet { updateCode() }
    }

    @Published var largeTitle: Bool {
        didSet { updateCode() }
    }

    @Published var subTitle: String {
        didSet { updateCode() }
    }

    @Published var hideBackButton: Bool {
        didSet { updateCode() }
    }

    @Published var showModalSheet: Bool = false
    @Published var showFullCover: Bool = false
    @Published var showNavigation: Bool = false

    // MARK: Initializer

    override init() {
        demoOption = .navigation

        largeTitle = false
        subTitle = ""

        hideBackButton = false

        super.init()

        leading = .icon
        numberOfLeadingItems = 1
        isLeadingEnabled = true
        isLeadingEmphasized = false

        trailing = .icon
        numberOfTrailingItems = 1
        isTrailingEnabled = true
        isTrailingEmphasized = false

        ios26ButtonStyle = .default
    }

    deinit {}

    // MARK: Component configuration

    @MainActor
    override func leadingItems(for theme: MISOTheme) -> [MISOToolBarItem] {
        let items = super.leadingItems(for: theme)

        // Add the close button for sheet
        if showFullCover || showModalSheet {
            return [MISOToolBarItem(navigation: .close)] + items
        } else {
            return items
        }
    }

    // MARK: Code update

    private var titlePattern: String {
        !title.isEmpty ? "\"\(title)\", " : ""
    }

    private var hasLargeTitlePattern: String {
        largeTitle ? ", hasLargeTitle: true" : ""
    }

    private var subtitlePattern: String {
        subTitle.isEmpty ? "" : ", subtitle: \"\(subTitle)\""
    }

    override func updateCode() {
        let leading = leadingItemsPattern.isEmpty ? "" :
            """
            leadingItems: {
              \(leadingItemsPattern)
            }
            """
        let principal = principalType != .none ?
            """
            , principalItem: \(principalItemPattern)
            """ : ""
        let trailing = trailingItemPattern.isEmpty ? "" :
            """
            , trailingItems: {
               \(trailingItemPattern)
            }
            """

        code = """
        SomeView()
        .toolBarTop(\(titlePattern)\(hasLargeTitlePattern)\(subtitlePattern)\(leading)\(principal)\(trailing))
        """
    }
}

// MARK: - ToolBarTop Configuration View

struct ToolBarTopConfiguration: View {

    // MARK: Stored properties

    @StateObject var configurationModel: ToolBarTopConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {

                MISOChipPicker(title: "app_components_topAppBar_demoOption_label".localized(),
                               selection: $configurationModel.demoOption,
                               chips: DemoOption.chips)

                MISOSwitchItem("app_components_topAppBar_largeTitle_tech", isOn: $configurationModel.largeTitle)

                if configurationModel.demoOption == .navigation {
                    MISOSwitchItem("app_components_topAppBar_hideBackButton_tech", isOn: $configurationModel.hideBackButton)
                }

                MISOHorizontalDivider()

                ToolBarLeadingConfiguration(configurationModel: configurationModel)

                MISOHorizontalDivider()

                ToolBarPrincipalConfiguration(configurationModel: configurationModel)

                MISOHorizontalDivider()

                ToolBarTrailingConfiguration(configurationModel: configurationModel)

                ToolBarItemStyle(configurationModel: configurationModel)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.title, label: "app_components_topAppBar_title_tech")
                    DesignToolboxTextField(text: $configurationModel.subTitle, label: "app_components_topAppBar_subtitle_tech")
                    DesignToolboxTextField(text: $configurationModel.leadingText, label: "app_components_toolbar_leadingText_label")
                    DesignToolboxTextField(text: $configurationModel.trailingText, label: "app_components_toolbar_trailingText_label")
                }
            }
        }
    }
}

// MARK: - Demo Options

enum DemoOption: DesignToolboxEnumLocalizedRepresentable {
    case navigation, modalSheet, fullCover

    var wordingKey: String {
        switch self {
        case .navigation:
            "app_components_topAppBar_demoOption_navigation_tech"
        case .modalSheet:
            "app_components_topAppBar_demoOption_modalSheet_tech"
        case .fullCover:
            "app_components_topAppBar_demoOption_fullCover_tech"
        }
    }
}

#endif
