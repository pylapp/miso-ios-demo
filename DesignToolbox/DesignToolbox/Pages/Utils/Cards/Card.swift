// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct Card: View {

    // MARK: Properties

    let title: LocalizedStringKey
    let illustration: AnyView

    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            CardIllustration(illustration: illustration)
            MISOHeading(title, size: .medium)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, theme.spaces.fixedMedium)
                .padding(.vertical, theme.spaces.fixedMedium)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(theme.colors.contentDefault)
        }
        .background(theme.colors.overlayDropdown)
        .shadow(theme.elevations.raised)
    }
}
