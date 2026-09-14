// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct CheckboxesOnlyView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink("Two-states", destination: TwoStatesCheckboxesOnlyView())
                NavigationLink("Three-states", destination: ThreeStatesCheckboxesOnlyView())
            }
        }
    }
}

// MARK: - Two-states checkboxes only

private struct TwoStatesCheckboxesOnlyView: View {

    @State private var isOn: Bool = true

    var body: some View {
        WatchScrollLayoutView(layout: {
            layout
        })
    }

    @ViewBuilder
    private var layout: some View {
        Text("Two-states checkboxes").font(.headline)

        Text("Enabled, no error").font(.subheadline)
        MISOCheckbox(isOn: $isOn,
                     accessibilityLabel: "Normal",
                     isError: false)

        Text("Enabled, on error").font(.subheadline)
        MISOCheckbox(isOn: $isOn,
                     accessibilityLabel: "Error",
                     isError: true)

        Text("Disabled, no error").font(.subheadline)
        MISOCheckbox(isOn: $isOn,
                     accessibilityLabel: "Disabled",
                     isError: false)
            .disabled(true)

        Text("Read only").font(.subheadline)
        MISOCheckbox(isOn: $isOn,
                     accessibilityLabel: "Read only",
                     isReadOnly: true)
    }
}

// MARK: - Three-states checkboxes only

private struct ThreeStatesCheckboxesOnlyView: View {

    @State private var state: MISOCheckboxIndicatorState = .indeterminate

    var body: some View {
        WatchScrollLayoutView(layout: {
            layout
        })
    }

    @ViewBuilder
    private var layout: some View {
        Text("Three-states checkboxes").font(.headline)

        Text("Enabled, no error").font(.subheadline)
        MISOCheckboxIndeterminate(selection: $state,
                                  accessibilityLabel: "Normal",
                                  isError: false)

        Text("Enabled, on error").font(.subheadline)
        MISOCheckboxIndeterminate(selection: $state,
                                  accessibilityLabel: "Error",
                                  isError: true)

        Text("Disabled, no error").font(.subheadline)
        MISOCheckboxIndeterminate(selection: $state,
                                  accessibilityLabel: "Disabled",
                                  isError: false)
            .disabled(true)

        Text("Read only").font(.subheadline)
        MISOCheckboxIndeterminate(selection: $state,
                                  accessibilityLabel: "Read only",
                                  isReadOnly: true)
    }
}
