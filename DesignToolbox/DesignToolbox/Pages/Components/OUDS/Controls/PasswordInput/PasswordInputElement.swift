// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

struct PasswordInputElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_passwordInput_tech".localized()
        illustration = AnyView(PasswordInputIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_passwordInput_description_text",
            version: MISOVersions.componentPasswordInputVersion,
            demoScreen: AnyView(PasswordInputPage())))
    }
}

private struct PasswordInputIllustration: View {

    @State private var password: String = ""

    var body: some View {
        MISOPasswordInput("app_components_common_label_label",
                          password: $password,
                          helperText: String(localized: "app_components_passwordInputHelperText_label"))
    }
}

#endif
