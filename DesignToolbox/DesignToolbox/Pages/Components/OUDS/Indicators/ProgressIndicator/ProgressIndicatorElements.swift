// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct ProgressIndicatorElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            CircularProgressIndicatorElement(),
            LinearProgressIndicatorElement(),
        ]

        name = "app_components_progressIndicator_tech".localized()
        illustration = AnyView(ProgressIndicatorIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_progressIndicator_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

private struct ProgressIndicatorIllustration: View {

    var body: some View {
        VStack(spacing: 8) {
            MISOCircularProgressIndicator(progress: 0.75, status: .accent, animated: false)
            MISOLinearProgressIndicator(progress: 0.75, status: .accent, animated: false)
                .frame(maxWidth: 120)
        }
    }
}
