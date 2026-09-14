// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI

struct CardIllustration: View {

    @Environment(\.theme) private var theme

    // MARK: Stored properties

    let illustration: AnyView

    // MARK: Body

    var body: some View {
        HStack {
            Spacer()
            illustration
                .accessibilityHidden(true)
                .allowsHitTesting(false)
            Spacer()
        }
        .frame(height: 184, alignment: .center)
        .accessibilityElement(children: .combine)
        .accessibilityRemoveTraits(.isImage)
        .accessibilityHidden(true)
        .foregroundStyle(theme.colors.contentDefault)
        .background(theme.colors.surfaceSecondary)
    }
}
