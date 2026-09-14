// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct SwitchesOnlyView: View {

    var body: some View {
        WatchScrollLayoutView(layout: {
            SwitchOnlyLayout()
        })
    }
}

private struct SwitchOnlyLayout: View {

    @State private var isOn: Bool = true

    var body: some View {
        Text("Enabled").font(.subheadline)
        MISOSwitch(isOn: $isOn, accessibilityLabel: "Switch")

        Text("Read only").font(.subheadline)
        MISOSwitch(isOn: $isOn, accessibilityLabel: "Switch", isReadOnly: true)

        Text("Disabled").font(.subheadline)
        MISOSwitch(isOn: $isOn, accessibilityLabel: "Switch")
            .disabled(true)
    }
}
