// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct CircularIndicatorsView: View {

    private static let allIndicatorStatus: [MISOProgressIndicatorStatus] = [.accent, .info, .negative, .positive, .neutral, .warning]

    var body: some View {
        WatchScrollLayoutView(title: "Circular Indicators",
                              layout: { WatchVerticalLayout { watchOSLayout } })
    }

    @ViewBuilder
    private var watchOSLayout: some View {
        Text("Indeterminate indicator").font(.headline)
        ForEach(Self.allIndicatorStatus, id: \.self) { status in
            Text("Status \(String(describing: status))").font(.subheadline)
            VStack {
                MISOCircularProgressIndicator(status: status, track: true, gapSize: .default)
                MISOCircularProgressIndicator(status: status, track: true, gapSize: .small)
                MISOCircularProgressIndicator(status: status, track: false, gapSize: .default)
                MISOCircularProgressIndicator(status: status, track: false, gapSize: .small)
            }
        }

        Text("Determinate indicator (50%)").font(.headline)
        ForEach(Self.allIndicatorStatus, id: \.self) { status in
            Text("Status \(String(describing: status))").font(.subheadline)
            VStack {
                MISOCircularProgressIndicator(progress: 0.50, status: status, track: true, gapSize: .default)
                MISOCircularProgressIndicator(progress: 0.50, status: status, track: true, gapSize: .small)
                MISOCircularProgressIndicator(progress: 0.50, status: status, track: false, gapSize: .default)
                MISOCircularProgressIndicator(progress: 0.50, status: status, track: false, gapSize: .small)
            }
        }
    }
}
