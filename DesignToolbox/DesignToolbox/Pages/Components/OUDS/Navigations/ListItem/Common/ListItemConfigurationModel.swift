// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - List Item Configuration Model

open class ListItemConfigurationModel: ComponentConfiguration {

    // MARK: - Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var containersAlignment: MISOListItemContainersAlignment {
        didSet { updateCode() }
    }

    @Published var contentStyleOption: ListContentStyle {
        didSet { updateCode() }
    }

    @Published var contentCardDecorationOption: ListItemContentCardStyle {
        didSet { updateCode() }
    }

    @Published var hasDivider: Bool {
        didSet { updateCode() }
    }

    @Published var hasBackground: Bool {
        didSet { updateCode() }
    }

    @Published var outlinedOnInteractionOnly: Bool {
        didSet { updateCode() }
    }

    @Published var roundedMedia: Bool {
        didSet { updateCode() }
    }

    @Published var numberOfItems: Int

    @Published var itemSize: MISOListItemSize {
        didSet {
            textsModel.itemSize = itemSize
            leadingModel.itemSize = itemSize
            trailingModel.itemSize = itemSize
            updateCode()
        }
    }

    // MARK: - Properties

    var textsModel: ListItemTextsConfigurationModel
    var leadingModel: ListItemLeadingConfigurationModel
    var trailingModel: ListItemTrailingConfigurationModel
    var componentInitCode: String = "MISOStaticListItem"

    // MARK: - List type

    enum ListContentStyle: DesignToolboxEnumLocalizedRepresentable {
        case item, card

        var wordingKey: String {
            switch self {
            case .item:
                "app_components_listItem_itemType_tech"
            case .card:
                "app_components_listItem_cardType_tech"
            }
        }
    }

    // MARK: - Initializer

    override init() {
        // Item Style
        contentStyleOption = .item
        contentCardDecorationOption = .strandard
        hasDivider = true
        hasBackground = true
        outlinedOnInteractionOnly = false

        itemSize = .default
        containersAlignment = .center

        // Item interaction
        enabled = true

        // Nested elements
        textsModel = ListItemTextsConfigurationModel(itemSize: .default)
        trailingModel = ListItemTrailingConfigurationModel(itemSize: .default)
        leadingModel = ListItemLeadingConfigurationModel(itemSize: .default)

        roundedMedia = false
        numberOfItems = 1

        super.init()

        register(textsModel)
        register(trailingModel)
        register(leadingModel)
    }

    deinit {}

    // MARK: - Data

    @MainActor
    var dataItems: [MISOListItemData] {
        (0 ..< numberOfItems).map { index in
            buildDataItem(for: index)
        }
    }

    @MainActor
    private func buildDataItem(for index: Int) -> MISOListItemData {
        let currentLabel = index == 0 ? textsModel.labelText : "\(textsModel.labelText) \(index + 1)"
        let slot: MISOListItemData.Slot? = textsModel.hasSlot ? .init { textsModel.textSlot() } : nil
        let bottomSlot: MISOListItemData.Slot? = textsModel.hasBottomSlot ? .init { textsModel.bottomSlot() } : nil

        if textsModel.overlineTextMode == .rich {
            let richOverline: AttributedString? = textsModel.overlineText.isEmpty ? nil : (try? AttributedString(markdown: textsModel.overlineText))
            return buildDataItemWithRichOverline(currentLabel: currentLabel, overline: richOverline, slot: slot, bottomSlot: bottomSlot)
        } else {
            let rawOverline: String? = textsModel.overlineText.isEmpty ? nil : textsModel.overlineText
            return buildDataItemWithRawOverline(currentLabel: currentLabel, overline: rawOverline, slot: slot, bottomSlot: bottomSlot)
        }
    }

    @MainActor
    private func buildDataItemWithRawOverline(currentLabel: String, overline: String?, slot: MISOListItemData.Slot?, bottomSlot: MISOListItemData.Slot?) -> MISOListItemData {
        switch textsModel.labelContentType {
        case .text:
            MISOListItemData(
                label: currentLabel,
                hasBoldLabel: textsModel.hasBoldLabel,
                description: textsModel.descriptionText.isEmpty ? nil : textsModel.descriptionText,
                overline: overline,
                extraLabel: textsModel.extraLabelText.isEmpty ? nil : textsModel.extraLabelText,
                helperText: textsModel.helperText.isEmpty ? nil : textsModel.helperText,
                textSlot: slot,
                bottomSlot: bottomSlot)
        case .customView:
            MISOListItemData(
                label: textsModel.customLabelView,
                accessibilityLabel: "Custom view label",
                description: textsModel.descriptionText.isEmpty ? nil : textsModel.descriptionText,
                overline: overline,
                extraLabel: textsModel.extraLabelText.isEmpty ? nil : textsModel.extraLabelText,
                helperText: textsModel.helperText.isEmpty ? nil : textsModel.helperText,
                textSlot: slot,
                bottomSlot: bottomSlot)
        }
    }

    @MainActor
    private func buildDataItemWithRichOverline(
        currentLabel: String,
        overline: AttributedString?,
        slot: MISOListItemData.Slot?,
        bottomSlot: MISOListItemData.Slot?) -> MISOListItemData
    {
        let safeOverline = overline ?? AttributedString("")
        switch textsModel.labelContentType {
        case .text:
            return MISOListItemData(
                label: currentLabel,
                overline: safeOverline,
                hasBoldLabel: textsModel.hasBoldLabel,
                description: textsModel.descriptionText.isEmpty ? nil : textsModel.descriptionText,
                extraLabel: textsModel.extraLabelText.isEmpty ? nil : textsModel.extraLabelText,
                helperText: textsModel.helperText.isEmpty ? nil : textsModel.helperText,
                textSlot: slot,
                bottomSlot: bottomSlot)
        case .customView:
            return MISOListItemData(
                label: textsModel.customLabelView,
                accessibilityLabel: "Custom view label",
                overline: safeOverline,
                description: textsModel.descriptionText.isEmpty ? nil : textsModel.descriptionText,
                extraLabel: textsModel.extraLabelText.isEmpty ? nil : textsModel.extraLabelText,
                helperText: textsModel.helperText.isEmpty ? nil : textsModel.helperText,
                textSlot: slot,
                bottomSlot: bottomSlot)
        }
    }

    var needRoundedMediaOption: Bool {
        leadingModel.needRoundedMediaOption || trailingModel.needRoundedMediaOption
    }

    var contentStyle: MISOListItemContentStyle {
        switch contentStyleOption {
        case .item:
            .item(divider: hasDivider, background: hasBackground)
        case .card:
            switch contentCardDecorationOption {
            case .outlined:
                .card(.outlined(onlyOnInteraction: outlinedOnInteractionOnly))
            case .strandard:
                .card(.standard(divider: hasDivider, background: hasBackground))
            }
        }
    }

    // MARK: - Code generation

    override func updateCode() {
        let leadingPart = leadingModel.code.isEmpty ? "" : ", leading: leading"
        let trailingPart = trailingModel.code.isEmpty ? "" : ", trailing: trailing"

        code = """
        \(dataPattern) \(leadingModel.code) \(trailingModel.code)

        \(componentInitCode)(data: data\(slotPattern)\(leadingPart)\(trailingPart))
        \(styleModifierPattern)\(sizeModifierPattern)\(containersAlignmentPattern)\(roundedMediaPattern)
        \(disableCodePattern)
        """
    }

    var disableCodePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    var dataPattern: String {
        switch textsModel.labelContentType {
        case .text:
            """
            let data = MISOListItemData(\(textsModel.code))
            """
        case .customView:
            """
            \(textsModel.customLabelPattern)
            let data = MISOListItemData(\(textsModel.code))
            """
        }
    }

    private var styleModifierPattern: String {
        if contentStyleOption == .card {
            let cardDecorationPattern = switch contentCardDecorationOption {
            case .outlined:
                ".outlined(onlyOnInteraction: \(outlinedOnInteractionOnly))"
            case .strandard:
                ".standard(\(dividerPattern), \(backgroundPattern))"
            }

            return ".misoListCardStyle(\(cardDecorationPattern))"
        } else {
            return ".misoListItemStyle(\(dividerPattern), \(backgroundPattern))"
        }
    }

    private var backgroundPattern: String {
        "background: \(hasBackground)"
    }

    private var dividerPattern: String {
        "divider: \(hasDivider)"
    }

    private var roundedMediaPattern: String {
        needRoundedMediaOption ? "\n.misoListItemRoundedMedia(\(roundedMedia))" : ""
    }

    private var sizeModifierPattern: String {
        itemSize == .default
            ? "" : "\n.misoListItemSize(\(itemSize.technicalDescription))"
    }

    private var containersAlignmentPattern: String {
        "\n.misoListItemContainerAlignment(\(containersAlignment.technicalDescription))"
    }

    private var slotPattern: String {
        var pattern = ""
        if textsModel.hasSlot {
            pattern += ", textSlot: someView()"
        }
        if textsModel.hasBottomSlot {
            pattern += ", bottomSlot: someView()"
        }
        return pattern
    }
}

// MARK: - List Item Content Card Style

enum ListItemContentCardStyle: DesignToolboxEnumRepresentable {
    case outlined, strandard
}

// MARK: - Extensions of MISOListItemContainersAlignment

extension MISOListItemContainersAlignment: @retroactive CaseIterable {}
extension MISOListItemContainersAlignment: DesignToolboxEnumRepresentable {
    public static let allCases: [MISOListItemContainersAlignment] = [
        .center, .top,
    ]
}
