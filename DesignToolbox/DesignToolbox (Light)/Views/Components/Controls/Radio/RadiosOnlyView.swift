// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct RadiosOnlyView: View {

    var body: some View {
        WatchScrollLayoutView(layout: {
            RadioOnlyLayout()
        })
    }
}

private struct RadioOnlyLayout: View {

    @State private var isOn: Bool = true

    var body: some View {
        Text("Enabled, no error").font(.subheadline)
        MISORadio(isOn: $isOn, accessibilityLabel: "Radio", isError: false)

        Text("Enabled, on error").font(.subheadline)
        MISORadio(isOn: $isOn, accessibilityLabel: "Radio", isError: true)
            .font(.subheadline)

        Text("Read only").font(.subheadline)
        MISORadio(isOn: $isOn, accessibilityLabel: "Radio", isReadOnly: true)

        Text("Disabled, no error")
        MISORadio(isOn: $isOn, accessibilityLabel: "Radio", isError: false)
            .disabled(true)
    }
}
