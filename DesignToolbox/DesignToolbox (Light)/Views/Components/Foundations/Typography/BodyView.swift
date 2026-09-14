// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct BodyView: View {

    private static let allSizes: [MISOBody.Size] = [.large, .medium, .small]
    private static let allWeights: [MISOBody.Weight] = [.default, .moderate, .strong]

    var body: some View {
        WatchScrollLayoutView(title: "Body", layout: { watchLayout })
    }

    @ViewBuilder
    private var watchLayout: some View {
        WatchVerticalLayout {
            ForEach(Self.allSizes, id: \.self) { size in
                Text("Size \(String(describing: size))").font(.subheadline)
                ForEach(Self.allWeights, id: \.self) { weight in
                    Text("Weight \(String(describing: weight))").font(.footnote)
                    MISOBody(text: "Aa", size: size, weight: weight)
                }
            }
        }
    }
}
