// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

/// A `View` with a very long text block
struct ToolBarCommonContentView: View {

    // MARK: - Properties

    @Environment(\.theme) private var theme
    @Environment(\.presentationMode) private var presentationMode

    // MARK: - Body

    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: theme.spaces.fixedLarge) {
                let link = MISOAlertMessage.Link(text: "app_components_toolbar_demo_backToConfiguration_label",
                                                 position: .bottom)
                {
                    presentationMode.wrappedValue.dismiss()
                }

                MISOAlertMessage(label: "app_components_toolbar_demo_content_label".localized(),
                                 status: .warning,
                                 link: link)

                MISOLabel("app_common_loremIpsum_tech", size: .large, weight: .default)
                    .gridMargin(.horizontal)
            }
            .frame(maxWidth: .infinity)
            .padding(.top, 20)
        }
    }
}

#endif
