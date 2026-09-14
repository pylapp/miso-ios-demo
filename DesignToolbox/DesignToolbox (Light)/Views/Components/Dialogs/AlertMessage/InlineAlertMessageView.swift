// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// swiftlint:disable accessibility_label_for_image
struct InlineAlertMessageView: View {

    @Environment(\.theme) private var theme

    var body: some View {
        WatchScrollLayoutView(title: "Inline Alert",
                              layout: { watchVerticalLayout })
    }

    private var watchVerticalLayout: some View {
        WatchVerticalLayout {
            MISOInlineAlert(label: "This is a neutral alert", status: .neutral())
            MISOInlineAlert(label: "This is also a neutral alert", status: .neutral(image: MISOImage(asset: Image(systemName: "figure.handball"))))
            MISOInlineAlert(label: "This is an accent alert", status: .accent())
            MISOInlineAlert(label: "This is also a accent alert", status: .neutral(image: MISOImage(asset: Image(systemName: "figure.handball"))))
            MISOInlineAlert(label: "This is a positive alert", status: .positive)
            MISOInlineAlert(label: "This is a info alert", status: .info)
            MISOInlineAlert(label: "This is a warning alert", status: .warning)
            MISOInlineAlert(label: "This is a negative alert", status: .negative)
        }
    }
}

// swiftlint:enable accessibility_label_for_image
