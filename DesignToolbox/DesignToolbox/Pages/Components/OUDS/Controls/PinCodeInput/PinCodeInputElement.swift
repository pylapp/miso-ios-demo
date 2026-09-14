// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

struct PinCodeInputElement: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        name = "app_components_pinCodeInput_tech".localized()
        illustration = AnyView(PinCodeInputIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            description: "app_components_pinCodeInput_description_text",
            version: MISOVersions.componentPinCodeInputVersion,
            demoScreen: AnyView(PinCodeInputPage())))
    }
}

private struct PinCodeInputIllustration: View {

    @State private var pinCode: String = "123"

    var body: some View {
        MISOPinCodeInput($pinCode, length: .six, helperText: String(localized: "app_components_pinCodeInputHelperText_label"))
    }
}

#endif
