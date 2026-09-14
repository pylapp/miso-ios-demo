// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI

// MARK: - MISO Checkbox Indicator State extension

extension MISOCheckboxIndicatorState: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    nonisolated(unsafe) public static var allCases: [MISOCheckboxIndicatorState] = [.selected, .unselected, .indeterminate]
}
