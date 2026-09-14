// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable accessibility_label_for_image

struct TwoStatesCheckboxesItemsView: View {

    @State private var isOn: Bool = true

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(layout: {
            watchLayout
        })
    }

    @ViewBuilder
    private var watchLayout: some View {
        Text("2-states checkboxes items").font(.headline)

        Text("No icons").font(.subheadline)

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         isReversed: false,
                         isReadOnly: false)

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         isReversed: true,
                         isReadOnly: false)

        Text("Disabled").font(.caption)

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         isReversed: false,
                         isReadOnly: false)
            .disabled(true)

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         isReversed: true,
                         isReadOnly: false)
            .disabled(true)

        Text("On error").font(.caption)

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         isReversed: false,
                         isError: true,
                         errorText: "Error")

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         isReversed: true,
                         isError: true,
                         errorText: "Error")

        Text("Read only").font(.caption)

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         isReversed: false,
                         isReadOnly: true)

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         isReversed: true,
                         isReadOnly: true)

        Text("With icons").font(.subheadline)

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         image: MISOImage(asset: Image(systemName: "flag.pattern.checkered")),
                         isReversed: false,
                         isReadOnly: false)

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         image: MISOImage(asset: Image(systemName: "flag.pattern.checkered")),
                         isReversed: true,
                         isReadOnly: false)

        Text("On error").font(.caption)

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         image: MISOImage(asset: Image(systemName: "flag.pattern.checkered")),
                         isReversed: false,
                         isError: true,
                         errorText: "Error")

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         image: MISOImage(asset: Image(systemName: "flag.pattern.checkered")),
                         isReversed: true,
                         isError: true,
                         errorText: "Error")

        Text("Disabled").font(.caption)

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         image: MISOImage(asset: Image(systemName: "flag.pattern.checkered")),
                         isReversed: false,
                         isReadOnly: false)
            .disabled(true)

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         image: MISOImage(asset: Image(systemName: "flag.pattern.checkered")),
                         isReversed: true,
                         isReadOnly: false)
            .disabled(true)

        Text("Read only").font(.caption)

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         image: MISOImage(asset: Image(systemName: "flag.pattern.checkered")),
                         isReversed: false,
                         isReadOnly: true)

        MISOCheckboxItem("Label",
                         isOn: $isOn,
                         description: "Description",
                         image: MISOImage(asset: Image(systemName: "flag.pattern.checkered")),
                         isReversed: true,
                         isReadOnly: true)
    }

    // MARK: - Helpers

    @ViewBuilder
    private func checkboxSection(
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
                MISOCheckboxItem("Label",
                                 isOn: $isOn,
                                 description: "Description",
                                 image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                                 isReversed: false,
                                 isError: isError,
                                 errorText: isError ? "Error" : nil,
                                 isReadOnly: isReadOnly)
                    .disabled(isDisabled)

                MISOCheckboxItem("Label",
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
}

// swiftlint:enable accessibility_label_for_image
