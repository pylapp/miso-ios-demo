// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct RadioElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        var variants: [DesignToolboxElement] = [
            RadioElement(),
            RadioItemElement(),
        ]
        #if !os(tvOS)
        // `MISORadioPickerPlacement` is not available on tvOS in the OUDS SDK.
        variants.append(RadioPickerElement())
        #endif

        name = "app_components_radioButton_tech".localized()
        illustration = AnyView(RadioIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_radioButton_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

private struct RadioIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.fixedNone) {
            // 🥜: dumb label, not vocalized, preventing warnings because of empty labels
            #if !os(visionOS)
            MISORadio(isOn: .constant(true), accessibilityLabel: "🥜")
            MISORadio(isOn: .constant(false), accessibilityLabel: "🥜")
            #else
            MISORadio(isOn: .constant(false), accessibilityLabel: "🥜")
            #endif
        }
    }
}
