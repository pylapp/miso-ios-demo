// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct CodeElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_typography_code_tech".localized()
        illustration = AnyView(CodeIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_typography_code_description_text",
            version: MISOVersions.componentTypographyVersion,
            demoScreen: AnyView(CodePage())))
    }
}

private struct CodeIllustration: View {

    var body: some View {
        MISOCode(text: "Aa")
    }
}
