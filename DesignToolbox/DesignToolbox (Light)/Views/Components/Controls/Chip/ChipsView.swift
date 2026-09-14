// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct ChipsView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Filter chip", destination: FilterChipView())
                NavigationLink("Suggestion chip", destination: SuggestionChipView())
            }
        }
        .navigationTitle("Chips")
    }
}

// MARK: - Filter chip

// swiftlint:disable accessibility_label_for_image
private struct FilterChipView: View {

    @State private var isSelected: Bool = true

    var body: some View {
        WatchScrollLayoutView(layout: {
            layout
        })
    }

    @ViewBuilder
    private var layout: some View {
        Text("Text only").font(.subheadline)
        MISOFilterChip(text: "Filter", selected: isSelected) { isSelected.toggle() }

        Text("Text + icon").font(.subheadline)
        MISOFilterChip(image: MISOImage(asset: Image(systemName: "sun.min.fill")), text: "Filter", selected: isSelected) { isSelected.toggle() }

        Text("Icon only").font(.subheadline)
        MISOFilterChip(image: MISOImage(asset: Image(systemName: "sun.min.fill")), accessibilityLabel: "Filter", selected: isSelected) { isSelected.toggle() }
    }
}

// swiftlint:enable accessibility_label_for_image

// MARK: - Suggestion chip

// swiftlint:disable accessibility_label_for_image
private struct SuggestionChipView: View {

    var body: some View {
        WatchScrollLayoutView(layout: {
            layout
        })
    }

    @ViewBuilder
    private var layout: some View {
        Text("Text only").font(.subheadline)
        MISOSuggestionChip(text: "Suggestion") {}

        Text("Text + icon").font(.subheadline)
        MISOSuggestionChip(image: MISOImage(asset: Image(systemName: "sun.min.fill")), text: "Suggestion") {}

        Text("Icon only").font(.subheadline)
        MISOSuggestionChip(image: MISOImage(asset: Image(systemName: "sun.min.fill")), accessibilityLabel: "Suggestion") {}
    }
}

// swiftlint:enable accessibility_label_for_image
