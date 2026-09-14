// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct LinearProgressIndicatorElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_progressIndicator_linear_tech".localized()
        illustration = AnyView(LinearProgressIndicatorIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_progressIndicator_linear_description_text",
            version: MISOVersions.componentLinearProgressIndicatorVersion,
            demoScreen: AnyView(LinearProgressIndicatorPage())))
    }
}

private struct LinearProgressIndicatorIllustration: View {

    var body: some View {
        MISOLinearProgressIndicator(progress: 0.75, animated: false)
            .frame(maxWidth: 120)
    }
}
