// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

extension NamedColor {

    enum Surface: String, CaseIterable {
        case surfaceBrandPrimary
        case surfaceBrandSecondary
        case surfaceBrandTertiary
        case surfaceStatusAccentEmphasized
        case surfaceStatusAccentMuted
        case surfaceStatusInfoEmphasized
        case surfaceStatusInfoMuted
        case surfaceStatusNegativeEmphasized
        case surfaceStatusNegativeMuted
        case surfaceStatusPositiveEmphasized
        case surfaceStatusPositiveMuted
        case surfaceStatusWarningEmphasized
        case surfaceStatusWarningMuted
        case surfaceInverseHigh
        case surfaceInverseLow
        case surfacePrimary
        case surfaceSecondary
        case surfaceTertiary

        func token(from theme: MISOTheme) -> MultipleColorSemanticToken {
            switch self {
            case .surfaceBrandPrimary:
                theme.colors.surfaceBrandPrimary
            case .surfaceBrandSecondary:
                theme.colors.surfaceBrandSecondary
            case .surfaceBrandTertiary:
                theme.colors.surfaceBrandTertiary
            case .surfaceStatusAccentEmphasized:
                theme.colors.surfaceStatusAccentEmphasized
            case .surfaceStatusAccentMuted:
                theme.colors.surfaceStatusAccentMuted
            case .surfaceStatusInfoEmphasized:
                theme.colors.surfaceStatusInfoEmphasized
            case .surfaceStatusInfoMuted:
                theme.colors.surfaceStatusInfoMuted
            case .surfaceStatusNegativeEmphasized:
                theme.colors.surfaceStatusNegativeEmphasized
            case .surfaceStatusNegativeMuted:
                theme.colors.surfaceStatusNegativeMuted
            case .surfaceInverseHigh:
                theme.colors.surfaceInverseHigh
            case .surfaceInverseLow:
                theme.colors.surfaceInverseLow
            case .surfaceStatusPositiveEmphasized:
                theme.colors.surfaceStatusPositiveEmphasized
            case .surfaceStatusPositiveMuted:
                theme.colors.surfaceStatusPositiveMuted
            case .surfaceStatusWarningEmphasized:
                theme.colors.surfaceStatusWarningEmphasized
            case .surfaceStatusWarningMuted:
                theme.colors.surfaceStatusWarningMuted
            case .surfacePrimary:
                theme.colors.surfacePrimary
            case .surfaceSecondary:
                theme.colors.surfaceSecondary
            case .surfaceTertiary:
                theme.colors.surfaceTertiary
            }
        }
    }
}
