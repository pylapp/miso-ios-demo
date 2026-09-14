// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Heading Configuration Model

/// The model shared between `HeadingPage` and `HeadingConfigurationView` views.
///
/// `MISOHeading` exposes two exclusive ways of rendering a heading:
/// - a plain text, optionally decorated with a *marker* (only honored for `size == .large`
///   and if the current theme supports it)
/// - a text with a colored sub-string (only meaningful for `size == .large`)
///
/// Because these two modes cannot be combined, the demo exposes a single switch
/// (`hasColoredSubstring`) to let the user pick one mode or the other.
final class HeadingConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var coloredText: String {
        didSet { updateCode() }
    }

    @Published var size: MISOHeading.Size {
        didSet { updateCode() }
    }

    @Published var hasMarker: Bool {
        didSet { updateCode() }
    }

    @Published var hasColoredSubstring: Bool {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        text = String(localized: "app_components_common_label_label")
        coloredText = String(localized: "app_components_common_label_label")
        size = .large
        hasMarker = false
        hasColoredSubstring = false
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        if hasColoredSubstring {
            code = """
            MISOHeading(text: "\(text)", coloredText: "\(coloredText)")
            """
        } else {
            code = """
            MISOHeading(text: "\(text)", size: \(size.technicalDescription), hasMarker: \(hasMarker))
            """
        }
    }

    func hasColoredStringSupported(by theme: MISOTheme) -> Bool {
        let isSupported = !theme.typography.headingLargeMarker
        if !isSupported, hasColoredSubstring {
            hasColoredSubstring = false
        }

        return isSupported
    }
}

// MARK: - Heading Configuration View

struct HeadingConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: HeadingConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {

                if !theme.typography.headingLargeMarker {
                    MISOSwitchItem("app_components_typography_coloredSubstring_tech", isOn: $configurationModel.hasColoredSubstring)
                } else {
                    MISOSwitchItem("app_components_typography_marker_tech", isOn: $configurationModel.hasMarker)
                        .disabled(configurationModel.size != .large)
                }

                // Size is forced to `.large` when a colored sub-string is used.
                if !(configurationModel.hasColoredStringSupported(by: theme) && configurationModel.hasColoredSubstring) {
                    MISOChipPicker(title: "app_components_common_size_tech",
                                   selection: $configurationModel.size,
                                   chips: MISOHeading.Size.chips)
                }
            }

            if configurationModel.hasColoredSubstring {
                DesignToolboxEditContentDisclosure {
                    VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
                        DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
                        DesignToolboxTextField(text: $configurationModel.coloredText, label: "app_components_typography_coloredText_tech")
                    }
                }
            } else {
                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.text, label: "app_components_common_label_tech")
                }
            }
        }
    }
}

// MARK: - Heading Size extension

extension MISOHeading.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOHeading.Size] = [.xLarge, .large, .medium, .small]
}
