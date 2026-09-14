// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable accessibility_label_for_image
// swiftlint:disable function_body_length

struct SwitchesItemView: View {

    @State private var isOn: Bool = true

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(layout: {
            watchLayout
        })
    }

    private var watchLayout: some View {
        WatchVerticalLayout {
            Text("With icon").font(.headline)
            detailedView(withIcon: true)

            Divider()

            Text("Without icon").font(.headline)
            detailedView(withIcon: false)
        }
    }

    // MARK: - Helpers

    @ViewBuilder
    private func switchSection(
        title: String,
        withIcon: Bool,
        isDisabled: Bool = false,
        isError: Bool = false,
        isReadOnly: Bool = false) -> some View
    {
        VStack(spacing: theme.spaces.scaledSmallMobile) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            VStack(spacing: theme.spaces.scaledXsmallMobile) {
                MISOSwitchItem(
                    "Label",
                    isOn: $isOn,
                    description: "Description",
                    image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                    isReversed: false,
                    isError: isError,
                    errorText: isError ? "Error" : nil,
                    isReadOnly: isReadOnly)
                    .disabled(isDisabled)

                MISOSwitchItem(
                    "Label",
                    isOn: $isOn,
                    description: "Description",
                    image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                    isReversed: true,
                    isError: isError,
                    errorText: isError ? "Error" : nil,
                    isReadOnly: isReadOnly)
                    .disabled(isDisabled)
            }
        }
        .padding()
    }

    @ViewBuilder
    private func detailedView(withIcon: Bool) -> some View {
        Text("Enabled").font(.caption)

        MISOSwitchItem("Label",
                       isOn: $isOn,
                       description: "Description",
                       image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                       isReversed: false,
                       isReadOnly: false)

        MISOSwitchItem("Label",
                       isOn: $isOn,
                       description: "Description",
                       image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                       isReversed: true,
                       isReadOnly: false)

        Text("On error").font(.caption)

        MISOSwitchItem("Label",
                       isOn: $isOn,
                       description: "Description",
                       image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                       isReversed: false,
                       isError: true,
                       errorText: "Error")

        MISOSwitchItem("Label",
                       isOn: $isOn,
                       description: "Description",
                       image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                       isReversed: true,
                       isError: true,
                       errorText: "Error")

        Text("Disabled").font(.caption)

        MISOSwitchItem("Label",
                       isOn: $isOn,
                       description: "Description",
                       image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                       isReversed: false,
                       isReadOnly: false)
            .disabled(true)

        MISOSwitchItem("Label",
                       isOn: $isOn,
                       description: "Description",
                       image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                       isReversed: true,
                       isReadOnly: false)
            .disabled(true)

        Text("Read only").font(.caption)

        MISOSwitchItem("Label",
                       isOn: $isOn,
                       description: "Description",
                       image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                       isReversed: false,
                       isReadOnly: true)

        MISOSwitchItem("Label",
                       isOn: $isOn,
                       description: "Description",
                       image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                       isReversed: true,
                       isReadOnly: true)
    }
}

// swiftlint:enable accessibility_label_for_image
// swiftlint:enable function_body_length
