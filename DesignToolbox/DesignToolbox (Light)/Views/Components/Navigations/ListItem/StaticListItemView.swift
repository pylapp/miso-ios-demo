// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct StaticListItemView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Static List Item",
                              layout: { watchOSLayout })
    }

    // MARK: - watchOS

    private var watchOSLayout: some View {
        WatchVerticalLayout {
            Text("Label only").font(.headline)

            MISOStaticListItem(data: MISOListItemData(label: "Label"))

            Text("More textual").font(.headline)

            let data = MISOListItemData(
                label: "Label",
                description: "Description",
                overline: "Overline",
                extraLabel: "Extra Label")
            MISOStaticListItem(data: data)

            Text("Leading icon, trailing badge").font(.headline)

            let icon = MISOListItemIcon(status: .info, description: "Information", size: .medium)
            let badge = MISOBadgeCount(3, accessibilityLabel: "3 notifications", status: .negative, size: .medium)

            MISOStaticListItem(
                data: MISOListItemData(label: "Label"),
                leading: .icon(icon),
                trailing: .badge(.count(badge)))

            Text("Leading avatar, trailing text").font(.headline)

            let avatar = MISOListItemAvatar(type: .icon, size: .medium)

            MISOStaticListItem(
                data: MISOListItemData(label: "Label", description: "Description"),
                leading: .avatar(avatar),
                trailing: .text(.label("Info")))
        }
    }
}
