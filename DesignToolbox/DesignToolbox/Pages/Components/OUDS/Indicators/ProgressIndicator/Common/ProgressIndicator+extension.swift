// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - MISO enum representable extensions

extension MISOProgressIndicatorStatus: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOProgressIndicatorStatus] = [.neutral, .accent, .positive, .info, .warning, .negative]
}

extension MISOProgressIndicatorGapSize: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOProgressIndicatorGapSize] = [.default, .small]
}
