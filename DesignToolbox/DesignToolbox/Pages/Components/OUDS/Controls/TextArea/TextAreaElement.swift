// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

struct TextAreaElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_textArea_tech".localized()
        illustration = AnyView(TextAreaIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_textArea_description_text",
            version: MISOVersions.componentTextAreaVersion,
            demoScreen: AnyView(TextAreaPage())))
    }
}

private struct TextAreaIllustration: View {

    @State private var text: String = ""

    var body: some View {
        MISOTextArea("app_components_common_label_label",
                     text: $text,
                     helperText: .plain(String(localized: "app_components_textAreaHelperText_label")))
            .padding()
    }
}

#endif
