// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable accessibility_label_for_image
struct ButtonsView: View {

    private static let kAllButtonAppaerances: [MISOButton.Appearance] = [.default, .strong, .brand, .minimal, .negative]
    private static let kAllButtonStyles: [MISOButton.Style] = [.default, .loading()]
    private static let kAllButtonSizes: [MISOButton.Size] = [.default, .small]

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Button",
                              layout: {
                                  watchLayout
                              })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            ForEach(Self.kAllButtonStyles, id: \.self) { style in
                Text("Style \(String(describing: style))").font(.headline)
                ForEach(Self.kAllButtonSizes, id: \.self) { size in
                    Text("Size \(String(describing: size))").font(.subheadline)
                    ForEach(Self.kAllButtonAppaerances, id: \.self) { appearance in
                        Text("Appearance \(String(describing: appearance))").font(.body)
                        MISOButton(text: "Button", appearance: appearance, style: style, size: size) {}
                        MISOButton(text: "Button", image: MISOImage(asset: Image(systemName: "sun.min.fill")), appearance: appearance, style: style, size: size) {}
                        MISOButton(image: MISOImage(asset: Image(systemName: "sun.min.fill"), accessibilityLabel: "Button"), appearance: appearance, style: style, size: size) {}
                    }
                }
            }
        }
    }
}

extension MISOButton.Style: @retroactive Hashable {
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .default:
            hasher.combine(0)
        case .loading:
            hasher.combine(1)
        }
    }
}

// swiftlint:enable accessibility_label_for_image
