// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct ChipElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            SuggestionChipElement(),
            FilterChipElement(),
            ChipPickerElement(),
        ]

        name = "app_components_chip_tech".localized()
        illustration = AnyView(ChipIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_chip_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

private struct ChipIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        HStack(spacing: theme.spaces.fixedSmall) {
            #if !os(visionOS)
            MISOFilterChip("app_components_common_label_label", selected: true) {}
            MISOSuggestionChip("app_components_common_label_label") {}
            #else
            MISOFilterChip(text: "🥜", selected: true) {}
            #endif
        }
    }
}
