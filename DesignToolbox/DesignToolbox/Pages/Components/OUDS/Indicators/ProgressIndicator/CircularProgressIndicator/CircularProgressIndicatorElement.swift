// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct CircularProgressIndicatorElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_progressIndicator_circular_tech".localized()
        illustration = AnyView(CircularProgressIndicatorIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_progressIndicator_circular_description_text",
            version: MISOVersions.componentCircularProgressIndicatorVersion,
            demoScreen: AnyView(CircularProgressIndicatorPage())))
    }
}

private struct CircularProgressIndicatorIllustration: View {

    var body: some View {
        MISOCircularProgressIndicator(progress: 0.75, animated: false)
    }
}
