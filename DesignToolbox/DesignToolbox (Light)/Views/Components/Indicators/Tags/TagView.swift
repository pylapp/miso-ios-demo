// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable accessibility_label_for_image

struct TagView: View {

    private static let allTagAppearances: [MISOTag.Appearance] = [.emphasized, .muted]
    private static let allTagShapes: [MISOTag.Shape] = [.rounded, .square]
    private static let allBadgeSizes: [MISOTag.Size] = [.default, .small]
    private static let allTagStatus: [MISOTag.Status] = [
        MISOTag.Status.positive(leading: .bullet),
        MISOTag.Status.positive(leading: .icon),
        MISOTag.Status.positive(leading: .none),
        MISOTag.Status.negative(leading: .bullet),
        MISOTag.Status.negative(leading: .icon),
        MISOTag.Status.negative(leading: .none),
        MISOTag.Status.warning(leading: .bullet),
        MISOTag.Status.warning(leading: .icon),
        MISOTag.Status.warning(leading: .none),
        MISOTag.Status.info(leading: .bullet),
        MISOTag.Status.info(leading: .icon),
        MISOTag.Status.info(leading: .none),
        MISOTag.Status.neutral(bullet: false),
        MISOTag.Status.neutral(bullet: true),
        MISOTag.Status.neutral(image: MISOImage(asset: Image(systemName: "sun.min.fill"))),
        MISOTag.Status.accent(bullet: false),
        MISOTag.Status.accent(bullet: true),
        MISOTag.Status.accent(image: MISOImage(asset: Image(systemName: "sun.min.fill"))),
    ]

    @State private var isSelected: Bool = true

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Tag") {
            watchOSLayout
        }
    }

    private var watchOSLayout: some View {
        WatchVerticalLayout {
            ForEach(Self.allTagStatus.indices, id: \.self) { statusIndex in
                Text("Status " + Self.description(for: statusIndex)).font(.headline)
                let status = Self.allTagStatus[statusIndex]
                ForEach(Self.allBadgeSizes, id: \.self) { size in
                    Text("Size \(String(describing: size))").font(.subheadline)
                    ForEach(Self.allTagShapes, id: \.self) { shape in
                        Text("Shape \(String(describing: shape))").font(.callout)
                        ForEach(Self.allTagAppearances, id: \.self) { appearance in
                            MISOTag(label: "Tag",
                                    status: status,
                                    appearance: appearance,
                                    shape: shape,
                                    size: size)

                            MISOTag(loadingLabel: "Tag",
                                    progress: nil,
                                    shape: shape,
                                    size: size)
                        }
                    }
                }
            }
        }
    }

    private static func description(for statusIndex: Int) -> String {
        if statusIndex <= 2 {
            return "positive"
        }
        if statusIndex <= 5 {
            return "negative"
        }
        if statusIndex <= 8 {
            return "warning"
        }
        if statusIndex <= 11 {
            return "info"
        }
        if statusIndex <= 14 {
            return "neutral"
        }
        if statusIndex <= 17 {
            return "accent"
        }
        return ""
    }
}

// swiftlint:enable accessibility_label_for_image
