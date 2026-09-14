// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct DesignToolboxTokenIllustration<TokenIllustration>: View where TokenIllustration: View {

    @Environment(\.theme) private var theme

    // MARK: Stored properties

    let tokenName: String
    let tokenValue: String?
    @ViewBuilder let tokenIllustration: () -> TokenIllustration

    // MARK: Initializer

    init(tokenName: String,
         tokenValue: String? = nil,
         tokenIllustration: @escaping () -> TokenIllustration)
    {
        self.tokenIllustration = tokenIllustration
        self.tokenName = tokenName
        self.tokenValue = tokenValue
    }

    // MARK: Body

    var body: some View {

        HStack(alignment: .top, spacing: theme.spaces.fixedMedium) {

            tokenIllustration()

            VStack(alignment: .leading) {
                MISOBody(text: tokenName, size: .large, weight: .strong)
                    .foregroundStyle(theme.colors.contentDefault)
                if let tokenValue {
                    MISOBody(text: tokenValue, size: .medium, weight: .default)
                        .foregroundStyle(theme.colors.contentMuted)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .accessibilityElement(children: .combine)
        }
        .padding(.vertical, theme.spaces.fixedXsmall)
        // On tvOS this makes the illustration row focusable so it can drive
        // the parent `ScrollView` (which otherwise cannot scroll because none
        // of the token illustrations expose a native focus target).
        .tvOSFocusableRow()
    }
}
