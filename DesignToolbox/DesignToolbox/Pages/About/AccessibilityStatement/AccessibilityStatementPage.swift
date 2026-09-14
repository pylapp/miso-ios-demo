// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if os(iOS)
import DeclarationAccessibility
import MISOSwiftUI
import SwiftUI

struct AccessibilityStatementPage: View {

    let detailsPageURL: URL
    @Environment(\.theme) var theme

    init() {
        guard let detailsPageURL = Bundle.main.url(forResource: "accessibility_detail", withExtension: "html") else {
            ML.fatal("Unable to find accessibility_detail.html in resources")
        }

        self.detailsPageURL = detailsPageURL
    }

    var body: some View {
        VStack {
            StatementView(xmlFile: "accessibility_result", localUrl: detailsPageURL.absoluteString, theme: theme)
        }
    }
}
#endif
