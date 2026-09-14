// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct LinearIndicatorsView: View {

    private static let allIndicatorStatus: [MISOProgressIndicatorStatus] = [.accent, .info, .negative, .positive, .neutral, .warning]

    var body: some View {
        WatchScrollLayoutView(title: "Linear Indicators",
                              layout: { WatchVerticalLayout { watchOSLayout } })
    }

    @ViewBuilder
    private var watchOSLayout: some View {
        Text("Indeterminate indicator").font(.headline)
        ForEach(Self.allIndicatorStatus, id: \.self) { status in
            Text("Status \(String(describing: status))").font(.subheadline)
            VStack {
                MISOLinearProgressIndicator(status: status, track: true, gapSize: .default)
                MISOLinearProgressIndicator(status: status, track: true, gapSize: .small)
                MISOLinearProgressIndicator(status: status, track: false, gapSize: .default)
                MISOLinearProgressIndicator(status: status, track: false, gapSize: .small)
            }
        }

        Text("Determinate indicator (50%)").font(.headline)
        ForEach(Self.allIndicatorStatus, id: \.self) { status in
            Text("Status \(String(describing: status))").font(.subheadline)
            VStack {
                MISOLinearProgressIndicator(progress: 0.50, status: status, track: true, gapSize: .default)
                MISOLinearProgressIndicator(progress: 0.50, status: status, track: true, gapSize: .small)
                MISOLinearProgressIndicator(progress: 0.50, status: status, track: false, gapSize: .default)
                MISOLinearProgressIndicator(progress: 0.50, status: status, track: false, gapSize: .small)
            }
        }

        Text("Determinate with helper text & stop indicator").font(.headline)
        MISOLinearProgressIndicator(progress: 0.50,
                                    status: .accent,
                                    stopIndicator: true,
                                    helperText: .description("Uploading…", alignment: .center))
    }
}
