// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

open class ListItemImageConfigurationModel: ComponentConfiguration {

    // MARK: Properties

    var itemSize: MISOListItemSize

    @Published var size: MISOListItemImage.Size {
        didSet { updateCode() }
    }

    @Published var ratio: MISOListItemImage.Ratio {
        didSet { updateCode() }
    }

    @Published var contentMode: ContentMode {
        didSet { updateCode() }
    }

    @Published var isAnimated: Bool {
        didSet { updateCode() }
    }

    // MARK: Initializer

    init(itemSize: MISOListItemSize) {
        self.itemSize = itemSize

        size = .medium
        ratio = .square
        contentMode = .fill
        isAnimated = false

        super.init()
    }

    deinit {}

    // MARK: Builder

    @MainActor
    func image(for theme: MISOTheme) -> MISOListItemImage {
        if isAnimated {
            let animatedImage = MISOAnimatedImage(named: "Animation", withExtension: "gif", bundle: .main)
            return MISOListItemImage(animatedImage: animatedImage,
                                     description: "app_components_listItem_image_a11y".localized(),
                                     size: size,
                                     ratio: ratio,
                                     contentMode: contentMode)
        } else {
            return MISOListItemImage(asset: Image.brandedPlaceholderImage(for: theme.name),
                                     description: "app_components_listItem_image_a11y".localized(),
                                     size: size,
                                     ratio: ratio,
                                     contentMode: contentMode)
        }
    }

    override func updateCode() {
        if isAnimated {
            code =
                """
                .init(animatedImage: MISOAnimatedImage(named: "Animation", withExtension: "gif")
                    \(sizePattern)
                    \(ratioPattern)
                    \(contentModePattern)
                    \(descriptionPattern))
                """
        } else {
            code =
                """
                .init(asset: "\(Image.placeholderImageSample())"
                    \(sizePattern)
                    \(ratioPattern)
                    \(contentModePattern)
                    \(descriptionPattern))
                """
        }
    }

    private var sizePattern: String {
        ", size: \(size.technicalDescription)"
    }

    private var ratioPattern: String {
        ", ratio: \(ratio.technicalDescription)"
    }

    private var contentModePattern: String {
        ", contentMode: \(contentMode.technicalDescription)"
    }

    private var descriptionPattern: String {
        ", description: \"\("app_components_listItem_image_a11y".localized())\""
    }
}

// MARK: - List Item Image Configuration

struct ListItemImageConfiguration: View {

    @ObservedObject var configurationModel: ListItemImageConfigurationModel

    var body: some View {
        if configurationModel.itemSize == .default {
            MISOChipPicker(title: "app_components_listItem_imageSize_tech".localized(),
                           selection: $configurationModel.size,
                           chips: MISOListItemImage.Size.chips)
        }

        MISOChipPicker(title: "app_components_listItem_imageRatio_tech".localized(),
                       selection: $configurationModel.ratio,
                       chips: MISOListItemImage.Ratio.chips)

        MISOChipPicker(title: "app_components_listItem_imageContentMode_tech".localized(),
                       selection: $configurationModel.contentMode,
                       chips: ContentMode.chips)

        MISOSwitchItem("app_components_animated_tech", isOn: $configurationModel.isAnimated)
    }
}

// MARK: - Extensions of MISOListItemSize

extension MISOListItemSize: @retroactive CaseIterable {}
extension MISOListItemSize: DesignToolboxEnumRepresentable {
    public static let allCases: [MISOListItemSize] = [.default, .small]
}

// MARK: - Extensions of MISOListItemImage.Size

extension MISOListItemImage.Size: @retroactive CaseIterable {}
extension MISOListItemImage.Size: DesignToolboxEnumRepresentable {
    public static let allCases: [MISOListItemImage.Size] = [
        .medium, .large, .extraLarge,
    ]
}

// MARK: - Extensions of MISOListItemImage.Ratio

extension MISOListItemImage.Ratio: @retroactive CaseIterable {}
extension MISOListItemImage.Ratio: DesignToolboxEnumRepresentable {
    public static let allCases: [MISOListItemImage.Ratio] = [.square, .widescreen]
}

// MARK: - Extensions of ContentMode

extension ContentMode: DesignToolboxEnumRepresentable {}
