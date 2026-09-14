// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct DesignToolboxProgressControl: View {

    @Binding var progress: Double
    @Environment(\.theme) private var theme

    var body: some View {

        #if os(tvOS)
        // `Slider` is not available on tvOS: expose discrete steps via a chip picker.
        MISOChipPicker(title: progressLabel,
                       selection: $progress,
                       chips: Self.progressSteps.map { value in
                           MISOChipPickerData(tag: value, layout: .text(text: "\(Int(value * 100)) %"))
                       })
        #else
        VStack(alignment: .leading, spacing: theme.spaces.fixedXsmall) {
            MISOLabel(LocalizedStringKey(progressLabel), size: .large, weight: .strong)
                .foregroundColor(theme.colors.contentDefault)
            Slider(value: $progress, in: 0 ... 1)
        }
        .padding(theme.spaces.fixedSmall)
        #endif
    }

    private var progressLabel: String {
        let percent = Int((progress * 100).rounded())
        return "\("app_components_common_progress_tech".localized()): \(percent) %"
    }

    #if os(tvOS)
    private static let progressSteps: [Double] = [0.0, 0.25, 0.5, 0.75, 1.0]
    #endif
}
