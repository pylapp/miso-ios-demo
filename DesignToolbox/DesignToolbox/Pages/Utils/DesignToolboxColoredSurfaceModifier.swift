// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Design Toolbox Colored Surface Modifier

/// Use the background modifier to place a view on a colored surface.
/// Defines a debug flag to display in logs some warnigns about WCAG 2.1 contrast ratios made in components definitions.
struct DesignToolboxColoredSurfaceModifier: ViewModifier {

    @Environment(\.theme) private var theme

    let coloredSurface: Bool

    func body(content: Content) -> some View {
        if coloredSurface {
            content
                .coloredSurface(theme.colorModes.onBrandPrimary)
                .modifier(DebugWCAG21RatiosModifier())
        } else {
            content
                .background(theme.colors.bgPrimary)
        }
    }
}

extension View {
    func designToolboxColoredSurface(_ coloredSurface: Bool) -> some View {
        modifier(DesignToolboxColoredSurfaceModifier(coloredSurface: coloredSurface))
    }
}

// MARK: - Debug WCAG 2.1 Ratios Modifier

struct DebugWCAG21RatiosModifier: ViewModifier {

    func body(content: Content) -> some View {
        content
            .onAppear {
                MISOWCAG21Ratio.misoDebugWCAG21Colors = true
            }
            .onDisappear {
                MISOWCAG21Ratio.misoDebugWCAG21Colors = false
            }
    }
}
