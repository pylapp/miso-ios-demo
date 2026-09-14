// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Badge Count Configuration Model

/// The model shared between `BadgeCountPageConfiguration` view and `BadgeCountPageComponent` view.
final class BadgeCountConfigurationModel: ComponentConfiguration {

    // MARK: Published properties

    @Published var enabled: Bool {
        didSet { updateCode() }
    }

    @Published var countSize: MISOBadgeCount.Size {
        didSet { updateCode() }
    }

    @Published var status: MISOBadgeStandard.Status {
        didSet { updateCode() }
    }

    @Published var countText: String {
        didSet { updateCode() }
    }

    // MARK: - Properties

    var count: UInt8 {
        UInt8(countText) ?? 1
    }

    // MARK: Initializer

    override init() {
        enabled = true
        countSize = .medium
        status = .neutral
        countText = "1"
        super.init()
    }

    deinit {}

    // MARK: Component Configuration

    override func updateCode() {
        code = """
        MISOBadgeCount(\(count), accessibilityLabel: someLabel, \(statusPattern), \(sizePattern))
        \(disablePattern)
        """
    }

    private var disablePattern: String {
        !enabled ? ".disabled(true)" : ""
    }

    private var statusPattern: String {
        "status: \(status.technicalDescription)"
    }

    private var sizePattern: String {
        "size: \(countSize.technicalDescription)"
    }
}

// MARK: - Badge Count Configuration View

struct BadgeCountConfigurationView: View {

    // MARK: Stored properties

    @StateObject var configurationModel: BadgeCountConfigurationModel
    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            MISOSwitchItem("app_common_enabled_tech", isOn: $configurationModel.enabled)

            MISOChipPicker(title: "app_components_common_size_tech",
                           selection: $configurationModel.countSize,
                           chips: MISOBadgeCount.Size.chips)

            MISOChipPicker(title: "app_components_common_status_tech",
                           selection: $configurationModel.status,
                           chips: MISOBadgeStandard.Status.chips)

            DesignToolboxEditContentDisclosure {
                DesignToolboxTextField(text: $configurationModel.countText, label: "app_components_badge_count_tech")
                    .numberPadKeyboard()
            }
        }
    }
}

extension MISOBadgeCount.Size: @retroactive CaseIterable, DesignToolboxEnumRepresentable {
    public static let allCases: [MISOBadgeCount.Size] = [.medium, .large]
}
