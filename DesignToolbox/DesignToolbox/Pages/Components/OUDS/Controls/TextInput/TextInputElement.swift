// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

struct TextInputElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_textInput_tech".localized()
        illustration = AnyView(TextInputIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_textInput_description_text",
            version: MISOVersions.componentTextInputVersion,
            demoScreen: AnyView(TextInputPage())))
    }
}

private struct TextInputIllustration: View {

    @State private var text: String = ""

    var body: some View {
        MISOTextInput("app_components_common_label_label",
                      text: $text,
                      helperText: String(localized: "app_components_textInputHelperText_label"))
    }
}

#endif
