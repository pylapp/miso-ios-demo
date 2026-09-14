// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable accessibility_label_for_image

struct ThreeStatesCheckboxesItemsView: View {

    @State private var state: MISOCheckboxIndicatorState = .indeterminate

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(layout: {
            watchLayout
        })
    }

    @ViewBuilder
    private var watchLayout: some View {
        Text("3-states checkboxes items").font(.headline)

        Text("No icons").font(.subheadline)

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: false,
                                      isReadOnly: false)

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: true,
                                      isReadOnly: false)

        Text("Disabled").font(.caption)

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: false,
                                      isReadOnly: false)
            .disabled(true)

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: true,
                                      isReadOnly: false)
            .disabled(true)

        Text("On error").font(.caption)

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: false,
                                      isError: true,
                                      errorText: "Error")

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: true,
                                      isError: true,
                                      errorText: "Error")

        Text("Read only").font(.subheadline)

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: false,
                                      isReadOnly: true)

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      isReversed: true,
                                      isReadOnly: true)

        Text("With icons").font(.caption)

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      image: MISOImage(asset: Image(systemName: "flag.pattern.checkered")),
                                      isReversed: false,
                                      isReadOnly: false)

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      image: MISOImage(asset: Image(systemName: "flag.pattern.checkered")),
                                      isReversed: true,
                                      isReadOnly: false)

        Text("On error").font(.caption)

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      image: MISOImage(asset: Image(systemName: "flag.pattern.checkered")),
                                      isReversed: false,
                                      isError: true,
                                      errorText: "Error")

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      image: MISOImage(asset: Image(systemName: "flag.pattern.checkered")),
                                      isReversed: true,
                                      isError: true,
                                      errorText: "Error")

        Text("Disabled").font(.caption)

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      image: MISOImage(asset: Image(systemName: "flag.pattern.checkered")),
                                      isReversed: false,
                                      isReadOnly: false)
            .disabled(true)

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      image: MISOImage(asset: Image(systemName: "flag.pattern.checkered")),
                                      isReversed: true,
                                      isReadOnly: false)
            .disabled(true)

        Text("Read only").font(.caption)

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
                                      description: "Description",
                                      image: MISOImage(asset: Image(systemName: "flag.pattern.checkered")),
                                      isReversed: false,
                                      isReadOnly: true)

        MISOCheckboxItemIndeterminate("Label",
                                      selection: $state,
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
                MISOCheckboxItemIndeterminate("Label",
                                              selection: $state,
                                              description: "Description",
                                              image: withIcon ? MISOImage(asset: Image(systemName: "flag.pattern.checkered")) : nil,
                                              isReversed: false,
                                              isError: isError,
                                              errorText: isError ? "Error" : nil,
                                              isReadOnly: isReadOnly)
                    .disabled(isDisabled)

                MISOCheckboxItemIndeterminate("Label",
                                              selection: $state,
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
