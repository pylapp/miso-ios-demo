// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

// MARK: - Radio Picker Configuration Model

/// The model shared between `RadioPickerConfiguration` view and `RadioPickerPage` view.
final class RadioPickerConfigurationModel: ComponentConfiguration {

    // MARK: - Properties

    @Published var pickerPlacement: MISORadioPickerPlacement {
        didSet { updateCode() }
    }

    @Published var hasDivider: Bool {
        didSet { updateCode() }
    }

    @Published var isReadOnly: Bool {
        didSet { updateCode() }
    }

    @Published var isError: Bool {
        didSet { updateCode() }
    }

    @Published var isReversed: Bool {
        didSet { updateCode() }
    }

    @Published var isOutlined: Bool {
        didSet { updateCode() }
    }

    @Published var isEnabled: Bool {
        didSet { updateCode() }
    }

    // MARK: - Initializer

    override init() {
        pickerPlacement = .vertical
        hasDivider = false
        isReadOnly = false
        isError = false
        isReversed = false
        isOutlined = false
        isEnabled = true
        super.init()
    }

    deinit {}

    // MARK: - Component Configuration

    // swiftlint:disable line_length
    override func updateCode() {
        code =
            """
            MISORadioPicker(selection: $selection, radios: someRadiosData, placement: \(pickerPlacementPattern)\(hasDividerPattern)\(isReadOnlyPattern)\(isErrorPattern)\(isReversedPattern)\(isOutlinedPattern))\(isEnabledPattern)
            """
    }

    // swiftlint:enable line_length

    private var pickerPlacementPattern: String {
        switch pickerPlacement {
        case .vertical:
            ".vertical"
        case let .horizontal(showsIndicator) where showsIndicator == true:
            ".horizontal(true)"
        case let .horizontal(showsIndicator) where showsIndicator == false:
            ".horizontal(false)"
        default:
            "🥜"
        }
    }

    private var hasDividerPattern: String {
        !hasDivider ? "" : ", hasDivider: true"
    }

    private var isReadOnlyPattern: String {
        !isReadOnly ? "" : ", isReadOnly: true"
    }

    private var isErrorPattern: String {
        !isError ? "" : ", isError: true"
    }

    private var isReversedPattern: String {
        !isReversed ? "" : ", isReversed: true"
    }

    private var isOutlinedPattern: String {
        !isOutlined ? "" : ", isOutlined: true"
    }

    private var isEnabledPattern: String {
        isEnabled ? "" : ".disabled(true)"
    }

    // MARK: - Data populating

    @MainActor func populate() -> [MISORadioPickerData<String>] {
        [
            MISORadioPickerData<String>(tag: "Choice_1",
                                        label: "Virgin Holy Lava",
                                        extraLabel: "Very spicy",
                                        description: "No alcohol, only tasty flavors",
                                        image: MISOImage(asset: Image(systemName: "flame")),
                                        accessibilityIdentifier: "Virgin Holy Lava"),

            MISORadioPickerData<String>(tag: "Choice_2",
                                        label: "IPA beer",
                                        extraLabel: "From Brewdog company",
                                        image: MISOImage(asset: Image(systemName: "dog.fill")),
                                        accessibilityIdentifier: "IPA beer"),

            MISORadioPickerData<String>(tag: "Choice_3",
                                        label: "Mineral water",
                                        image: MISOImage(asset: Image(systemName: "waterbottle.fill")),
                                        accessibilityIdentifier: "Mineral water"),
        ]
    }
}

// MARK: - Radio Picker Configuration View

struct RadioPickerConfiguration: View {

    @ObservedObject var configurationModel: RadioPickerConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            MISOSwitchItem("app_common_enabled_tech", isOn: $configurationModel.isEnabled)
                .disabled(configurationModel.isError || configurationModel.isReadOnly)

            MISOSwitchItem("app_components_common_readOnly_tech", isOn: $configurationModel.isReadOnly)
                .disabled(!configurationModel.isEnabled || configurationModel.isError)

            MISOSwitchItem("app_components_common_error_tech", isOn: $configurationModel.isError)
                .disabled(!configurationModel.isEnabled || configurationModel.isReadOnly)

            MISOSwitchItem("app_components_common_outlined_tech", isOn: $configurationModel.isOutlined)

            MISOSwitchItem("app_components_controlItem_divider_tech", isOn: $configurationModel.hasDivider)

            MISOChipPicker(title: "app_components_common_orientation_tech",
                           selection: $configurationModel.pickerPlacement,
                           chips: MISORadioPickerPlacement.chips)
        }
    }
}

// MARK: - Extension of MISORadioPickerPlacement

extension MISORadioPickerPlacement: @retroactive Equatable, @retroactive CaseIterable, @retroactive Hashable, DesignToolboxEnumLocalizedRepresentable {

    // MARK: Case Iterable

    public static var allCases: [MISORadioPickerPlacement] {
        [.vertical, .horizontal(true), .horizontal(false)]
    }

    var id: String {
        wordingKey
    }

    // MARK: Custom String Convertible

    var wordingKey: String {
        switch self {
        case let .horizontal(showIndicator) where showIndicator == true:
            "Horizontal with indicator"
        case let .horizontal(showIndicator) where showIndicator == false:
            "Horizontal without indicator"
        case .vertical:
            "Vertical"
        default:
            "🥜"
        }
    }

    // MARK: Equatable

    public static func == (lhs: MISORadioPickerPlacement, rhs: MISORadioPickerPlacement) -> Bool {
        lhs.id == rhs.id
    }

    // MARK: - Hashable

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

#endif
