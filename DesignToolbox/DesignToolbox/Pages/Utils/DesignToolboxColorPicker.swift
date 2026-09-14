// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct DesignToolboxColorPicker<Content, SelectedColor>: View where Content: View, SelectedColor: View {

    let content: () -> Content
    let selectedColor: () -> SelectedColor
    @State private var isExpanded: Bool = false
    @Environment(\.theme) private var theme

    var body: some View {
        DesignToolboxDisclosureGroup(isExpanded: $isExpanded, accessibilityLabel: "app_components_common_color_label_a11y") {
            VStack(alignment: .leading) {
                content()
            }
        } label: {
            VStack(alignment: .leading) {
                MISOHeading("app_components_common_color_tech", size: .medium)
                    .headingMedium(theme)
                    .foregroundColor(theme.colors.contentDefault)

                selectedColor()

                if isExpanded {
                    MISOHorizontalDivider()
                }
            }
        }
        .padding(.horizontal, theme.spaces.fixedMedium)
    }
}

struct DesignToolboxColorEntry<ColorIcon>: View where ColorIcon: View {

    let colorName: String
    let colorIcon: () -> ColorIcon
    @Environment(\.theme) private var theme

    var body: some View {
        Label {
            Text(colorName)
                .foregroundColor(theme.colors.contentDefault)
        } icon: {
            colorIcon()
                .frame(width: 30, height: 30, alignment: .leading)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
