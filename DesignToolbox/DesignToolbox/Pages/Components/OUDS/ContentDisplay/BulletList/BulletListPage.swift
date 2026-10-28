// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: Bullet List page

struct BulletListPage: View {

    @StateObject private var configurationModel: BulletListConfigurationModel

    init() {
        _configurationModel = StateObject(wrappedValue: BulletListConfigurationModel())
    }

    var body: some View {
        ComponentConfigurationView(configuration: configurationModel) {
            BulletListDemo(configurationModel: configurationModel)
        } configurationView: {
            BulletListConfigurationView(configurationModel: configurationModel)
        }
    }
}

// MARK: - Bullet List Demo

struct BulletListDemo: View {

    @StateObject var configurationModel: BulletListConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        Group {
            // To keep things simple, assuming the rich/raw mode is for all parameters
            switch configurationModel.textMode {
            case .raw:
                MISOBulletList(type: bulletType,
                               textStyle: configurationModel.textStyle,
                               isBold: configurationModel.isBold,
                               items: rawItems)
            case .rich:
                MISOBulletList(type: bulletType,
                               textStyle: configurationModel.textStyle,
                               isBold: configurationModel.isBold,
                               items: richItems)
            }
        }
        .showSkeleton(isVisible: configurationModel.showSkeleton)
    }

    @MISOBulletListItemBuilder
    private func rawItems() -> [MISOBulletList.Item] {
        let label = configurationModel.label
        switch configurationModel.levelCount {
        case .one:
            MISOBulletList.Item(.raw(label))
            MISOBulletList.Item(.raw(label))
            MISOBulletList.Item(.raw(label))
        case .two:
            MISOBulletList.Item(.raw(label)) {
                MISOBulletList.Item(.raw(label))
                MISOBulletList.Item(.raw(label))
            }
        case .three:
            MISOBulletList.Item(.raw(label)) {
                MISOBulletList.Item(.raw(label)) {
                    MISOBulletList.Item(.raw(label))
                }
            }
        }
    }

    @MISOBulletListItemBuilder
    private func richItems() -> [MISOBulletList.Item] {
        let richLabel = configurationModel.richLabel
        switch configurationModel.levelCount {
        case .one:
            MISOBulletList.Item(.rich(richLabel))
            MISOBulletList.Item(.rich(richLabel))
            MISOBulletList.Item(.rich(richLabel))
        case .two:
            MISOBulletList.Item(.rich(richLabel)) {
                MISOBulletList.Item(.rich(richLabel))
                MISOBulletList.Item(.rich(richLabel))
            }
        case .three:
            MISOBulletList.Item(.rich(richLabel)) {
                MISOBulletList.Item(.rich(richLabel)) {
                    MISOBulletList.Item(.rich(richLabel))
                }
            }
        }
    }

    private var bulletType: MISOBulletList.`Type` {
        switch configurationModel.bulletType {
        case .unordered:
            .unordered(asset: unorderedAsset, isBranded: configurationModel.unorderedBulletIsBranded)
        case .bare:
            .bare
        case .ordered:
            .ordered
        }
    }

    private var unorderedAsset: MISOBulletList.UnorderedAsset {
        switch configurationModel.unorderedAsset {
        case .bullet:
            .bullet
        case .tick:
            .tick
        case .icon:
            .icon(Image.defaultImage(prefixedBy: theme.name))
        }
    }
}
