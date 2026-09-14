// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable accessibility_label_for_image
struct BadgesView: View {

    private static let allBadgeStandardStatus: [MISOBadgeStandard.Status] = [.accent, .info, .negative, .positive, .neutral, .warning]
    private static let allBadgeIconStatus: [MISOBadgeIcon.Status]
        = [
            .accent(image: MISOImage(asset: Image(systemName: "sun.min.fill"))),
            .info,
            .negative,
            .positive,
            .neutral(image: MISOImage(asset: Image(systemName: "sun.min.fill"))),
            .warning,
        ]
    private static let allBadgeCountStatus: [MISOBadgeStandard.Status] = [.accent, .info, .negative, .positive, .neutral, .warning]
    private static let allBadgeStandardSizes: [MISOBadgeStandard.Size] = [.extraSmall, .small, .medium, .large]
    private static let allBadgeIconSizes: [MISOBadgeStandard.Size] = [.extraSmall, .small, .medium, .large]
    private static let allBadgeCountSizes: [MISOBadgeCount.Size] = [.medium, .large]

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Badges",
                              layout: { WatchVerticalLayout { watchOSLayout } })
    }

    @ViewBuilder
    private var watchOSLayout: some View {
        Text("Standard badges").font(.headline)
        ForEach(Self.allBadgeStandardSizes, id: \.self) { size in
            Text("Standard size \(String(describing: size))").font(.subheadline)
            ForEach(Self.allBadgeStandardStatus, id: \.self) { status in
                MISOBadgeStandard(accessibilityLabel: "Foo", status: status, size: size)
            }
        }

        Text("Icon badges").font(.headline)
        ForEach(Self.allBadgeIconSizes, id: \.self) { size in
            Text("Icon size \(String(describing: size))").font(.subheadline)
            ForEach(0 ..< Self.allBadgeIconStatus.count, id: \.self) { index in
                let status = Self.allBadgeIconStatus[index]
                MISOBadgeIcon(status: status, accessibilityLabel: "Foo", size: size)
            }
        }

        Text("Count badges").font(.headline)
        ForEach(Self.allBadgeCountSizes, id: \.self) { size in
            Text("Count size \(String(describing: size))").font(.subheadline)
            ForEach(Self.allBadgeCountStatus, id: \.self) { status in
                MISOBadgeCount(100, accessibilityLabel: "Foo", status: status, size: size)
            }
        }
    }
}

// swiftlint:enable accessibility_label_for_image
