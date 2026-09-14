// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable accessibility_label_for_image
// swiftlint:disable function_body_length

struct RadiosItemView: View {

    @State private var isOn: Bool = false

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(layout: {
            watchOSLayout
        })
    }

    private var watchOSLayout: some View {
        WatchVerticalLayout {
            Text("Without icon").font(.headline)
            detailedView(withIcon: false)

            Divider()

            Text("With icon").font(.headline)
            detailedView(withIcon: true)
        }
    }

    // MARK: - Helpers

    @ViewBuilder
    private func radioSection(
        title: String,
        withIcon: Bool,
        isDisabled: Bool = false,
        isError: Bool = false,
        isOutlined: Bool = false,
        isReadOnly: Bool = false) -> some View
    {
        VStack(spacing: theme.spaces.scaledSmallMobile) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)

            VStack(spacing: theme.spaces.scaledXsmallMobile) {
                // Normal (isReversed: false)
                MISORadioItem(
                    "Label",
                    isOn: $isOn,
                    extraLabel: "Additional",
                    description: "Description",
                    image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                    isOutlined: isOutlined,
                    isReversed: false,
                    isError: isError,
                    errorText: isError ? "Error" : nil,
                    isReadOnly: isReadOnly)
                    .disabled(isDisabled)

                // Reversed (isReversed: true)
                MISORadioItem(
                    "Label",
                    isOn: $isOn,
                    extraLabel: "Additional",
                    description: "Description",
                    image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                    isOutlined: isOutlined,
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

        MISORadioItem("Label",
                      isOn: $isOn,
                      extraLabel: "Additional",
                      description: "Description",
                      image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                      isReversed: false,
                      isReadOnly: false)

        MISORadioItem("Label",
                      isOn: $isOn,
                      extraLabel: "Additional",
                      description: "Description",
                      image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                      isReversed: true,
                      isReadOnly: false)

        Text("On error").font(.caption)

        Text("Not outlined").font(.callout)

        MISORadioItem("Label",
                      isOn: $isOn,
                      extraLabel: "Additional",
                      description: "Description",
                      image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                      isReversed: false,
                      isError: true,
                      errorText: "Error")

        MISORadioItem("Label",
                      isOn: $isOn,
                      extraLabel: "Additional",
                      description: "Description",
                      image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                      isReversed: true,
                      isError: true,
                      errorText: "Error")

        Text("Outlined").font(.callout)

        MISORadioItem("Label",
                      isOn: $isOn,
                      extraLabel: "Additional",
                      description: "Description",
                      image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                      isOutlined: true,
                      isReversed: false,
                      isError: true,
                      errorText: "Error")

        MISORadioItem("Label",
                      isOn: $isOn,
                      extraLabel: "Additional",
                      description: "Description",
                      image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                      isOutlined: true,
                      isReversed: true,
                      isError: true,
                      errorText: "Error")

        Text("Disabled").font(.caption)

        MISORadioItem("Label",
                      isOn: $isOn,
                      extraLabel: "Additional",
                      description: "Description",
                      image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                      isReversed: false,
                      isReadOnly: false)
            .disabled(true)

        MISORadioItem("Label",
                      isOn: $isOn,
                      extraLabel: "Additional",
                      description: "Description",
                      image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                      isReversed: true,
                      isReadOnly: false)
            .disabled(true)

        Text("Read only").font(.caption)

        MISORadioItem("Label",
                      isOn: $isOn,
                      extraLabel: "Additional",
                      description: "Description",
                      image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                      isReversed: false,
                      isReadOnly: true)

        MISORadioItem("Label",
                      isOn: $isOn,
                      extraLabel: "Additional",
                      description: "Description",
                      image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                      isReversed: true,
                      isReadOnly: true)
    }
}

// swiftlint:enable accessibility_label_for_image
// swiftlint:enable function_body_length
