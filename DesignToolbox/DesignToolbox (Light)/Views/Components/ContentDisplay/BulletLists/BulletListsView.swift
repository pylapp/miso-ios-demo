// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable closure_body_length

struct BulletListsView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Bullet List",
                              layout: { watchOSVerticalLayout })
    }

    private var watchOSVerticalLayout: some View {
        WatchVerticalLayout {
            Text("Bare").font(.headline)

            Text("Body Large").font(.subheadline)
            MISOBulletList(type: .bare) {
                MISOBulletList.Item("Label") {
                    MISOBulletList.Item("Label") {
                        MISOBulletList.Item("Label")
                    }
                }
            }

            Text("Body Medium").font(.subheadline)
            MISOBulletList(type: .bare, textStyle: .bodyMedium) {
                MISOBulletList.Item("Label") {
                    MISOBulletList.Item("Label") {
                        MISOBulletList.Item("Label")
                    }
                }
            }

            Text("Ordered").font(.headline)

            Text("Body Large").font(.subheadline)
            MISOBulletList(type: .ordered) {
                MISOBulletList.Item("Label") {
                    MISOBulletList.Item("Label") {
                        MISOBulletList.Item("Label")
                    }
                }
            }

            Text("Body Medium").font(.subheadline)
            MISOBulletList(type: .ordered, textStyle: .bodyMedium) {
                MISOBulletList.Item("Label") {
                    MISOBulletList.Item("Label") {
                        MISOBulletList.Item("Label")
                    }
                }
            }

            Text("Unordered (bullet)").font(.headline)

            Text("Body Large").font(.subheadline)
            MISOBulletList {
                MISOBulletList.Item("Label") {
                    MISOBulletList.Item("Label") {
                        MISOBulletList.Item("Label")
                    }
                }
            }

            Text("Body Medium").font(.subheadline)
            MISOBulletList(textStyle: .bodyMedium) {
                MISOBulletList.Item("Label") {
                    MISOBulletList.Item("Label") {
                        MISOBulletList.Item("Label")
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func bulletListSection(title: String, @ViewBuilder content: () -> some View) -> some View {
        VStack(spacing: theme.spaces.paddingBlockMedium) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            VStack(spacing: theme.spaces.paddingBlockXsmall) {
                content()
            }
        }
        .padding()
    }
}

// swiftlint:enable closure_body_length
