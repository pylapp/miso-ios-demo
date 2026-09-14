// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Badge Standard Configuration Model

/// The model shared between `BadgeStandardPageConfiguration` view and `BadgeStandardPageComponent` view.
final class BadgeStandardConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var standardSize: MISOBadgeStandard.Size {
        didSet { updateCode() }
    }

    @Published var status: MISOBadgeStandard.Status {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        enabled = true
        standardSize = .medium
        status = .neutral
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code = """
        MISOBadgeStandard(accessibilityLabel: someLabel, \(statusPattern), \(sizePattern))
        \(disablePattern)
        """
    }

    private var disablePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    var statusPattern: String {
        "status: \(status.technicalDescription)"
    }

    private var sizePattern: String {
        "size: \(standardSize.technicalDescription)"
    }
}

// MARK: - Badge Standard Configuration View

struct BadgeStandardConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: BadgeStandardConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            MISOSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

            MISOChipPicker(title: "app_components_common_size_tech",
                           selection: $configurationModel.standardSize,
                           chips: MISOBadgeStandard.Size.chips)

            MISOChipPicker(title: "app_components_common_status_tech",
                           selection: $configurationModel.status,
                           chips: MISOBadgeStandard.Status.chips)
        }
    }
}

extension MISOBadgeStandard.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOBadgeStandard.Size] = [.extraSmall, .small, .medium, .large]
}

extension MISOBadgeStandard.Status: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOBadgeStandard.Status] = [.neutral, .accent, .positive, .info, .warning, .negative]
}
