// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct CheckboxElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        var variants: [DesignToolboxElement] = [
            CheckboxElement(),
            CheckboxItemElement(),
            CheckboxIndeterminateElement(),
            CheckboxItemIndeterminateElement(),
        ]
        #if !os(tvOS)
        // `MISOCheckboxPickerPlacement` is not available on tvOS in the MISO SDK.
        variants.append(CheckboxPickerElement())
        #endif

        name = "app_components_checkbox_tech".localized()
        illustration = AnyView(CheckboxIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_checkbox_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

private struct CheckboxIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(spacing: theme.spaces.fixedNone) {
            #if !os(visionOS)
            // 🥜: dumb label, not vocalized, preventing warnings because of empty labels
            MISOCheckbox(isOn: .constant(true), accessibilityLabel: "🥜")
            MISOCheckbox(isOn: .constant(false), accessibilityLabel: "🥜")
            #else
            MISOCheckbox(isOn: .constant(true), accessibilityLabel: "🥜")
            #endif
        }
    }
}
