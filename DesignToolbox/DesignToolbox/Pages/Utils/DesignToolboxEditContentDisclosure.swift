// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct DesignToolboxEditContentDisclosure<Content>: View where Content: View {

    // MARK: - Properties

    private let title: String
    @ViewBuilder private let content: () -> Content
    @State private var isContentVisible = false

    @Environment(\.theme) private var theme

    // MARK: - Initializer

    init(_ title: String = "app_components_common_editContent_label",
         isContentVisible: Bool = false,
         @ViewBuilder content: @escaping () -> Content)
    {
        self.title = title.localized()
        self.isContentVisible = isContentVisible
        self.content = content
    }

    // MARK: - Body

    var body: some View {
        DesignToolboxDisclosureGroup(isExpanded: $isContentVisible, accessibilityLabel: "", content: content) {
            MISOHeading(text: title, size: .small)
                .foregroundStyle(theme.colors.contentDefault)
                .accessibilityAddTraits([.isButton])
        }
        .padding(.horizontal, theme.spaces.fixedMedium)
    }
}
