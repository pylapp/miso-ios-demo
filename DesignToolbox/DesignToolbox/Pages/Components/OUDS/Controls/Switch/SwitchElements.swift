// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct SwitchElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            SwitchElement(),
            SwitchItemElement(),
        ]

        name = "app_components_switch_tech".localized()
        illustration = AnyView(SwitchIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_switch_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

private struct SwitchIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.fixedSmall) {
            #if !os(visionOS)
            // 🥜: dumb label, not vocalized, preventing warnings because of empty labels
            MISOSwitch(isOn: .constant(true), accessibilityLabel: "🥜")
            MISOSwitch(isOn: .constant(false), accessibilityLabel: "🥜")
            #else
            MISOSwitch(isOn: .constant(true), accessibilityLabel: "🥜")
            #endif
        }
    }
}
