// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct TypographyElements: DesignToolboxElement {
    let name: String
    let illustration: AnyView
    let pageDescription: AnyView

    init() {
        let variants: [DesignToolboxElement] = [
            DisplayElement(),
            HeadingElement(),
            BodyElement(),
            LabelElement(),
            CodeElement(),
        ]

        name = "app_components_typography_tech".localized()
        illustration = AnyView(TypographyIllustration())
        pageDescription = AnyView(DesignToolboxElementPage(
            name: name,
            illustration: illustration,
            description: "app_components_typography_description_text",
            demoScreen: AnyView(DesignToolboxVariantElement(elements: variants))))
    }
}

struct TypographyIllustration: View {

    @Environment(\.theme) private var theme

    var body: some View {
        if theme.typography.headingLargeMarker {
            MISOHeading(text: "Welcome here!", size: .large, hasMarker: theme.typography.headingLargeMarker)
        } else {
            MISOHeading(text: "Welcome here!", coloredText: "here!")
        }
    }
}
