// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if !os(tvOS)

import MISOSwiftUI
import SwiftUI

// MARK: - TextArea Helper Mode

/// Describes the four helper-text display modes available in the configuration panel.
enum TextAreaHelperMode: DesignToolboxEnumLocalizedRepresentable {
    case none, plain, rich, charactersMaxCount

    var wordingKey: String {
        switch self {
        case .none:
            "app_components_common_none_tech"
        case .plain:
            "app_components_common_helperText_tech"
        case .rich:
            "app_components_common_helperRichText_tech"
        case .charactersMaxCount:
            "app_components_textArea_charactersMaxCount_tech"
        }
    }
}

// MARK: - Text Area Status

/// Describes the status available in the configuration panel, to map with `MISOTextArea.Status`
enum TextAreaStatus: DesignToolboxEnumLocalizedRepresentable {
    case enabled, error, richError, loading, readOnly, disabled

    var wordingKey: String {
        switch self {
        case .enabled:
            "app_common_enabled_tech"
        case .error:
            "app_components_common_error_tech"
        case .richError:
            "app_components_common_richError_tech"
        case .loading:
            "app_components_common_loader_tech"
        case .readOnly:
            "app_components_common_readOnly_tech"
        case .disabled:
            "app_common_disabled_tech"
        }
    }
}

// MARK: - TextArea Configuration Model

/// The model shared between `TextAreaConfigurationView` and `TextAreaDemo`.
final class TextAreaConfigurationModel: ComponentConfiguration {

    // MARK: Stored properties

    private let defaultLabel = String(localized: "app_components_common_label_label")
    private let defaultErrorText = String(localized: "app_components_textArea_errorDescription_label")

    // MARK: Published properties

    @Published var label: String {
        didSet { updateCode() }
    }

    @Published var placeholderText: String {
        didSet { updateCode() }
    }

    @Published var text: String {
        didSet { updateCode() }
    }

    @Published var helperMode: TextAreaHelperMode {
        didSet { updateCode() }
    }

    @Published var helperText: String {
        didSet { updateCode() }
    }

    @Published var maxCharacters: Int {
        didSet { updateCode() }
    }

    @Published var errorText: String {
        didSet { updateCode() }
    }

    @Published var helperLinkText: String {
        didSet { updateCode() }
    }

    @Published var isOutlined: Bool {
        didSet { updateCode() }
    }

    @Published var constrainedMaxWidth: Bool {
        didSet { updateCode() }
    }

    @Published var constrainedMaxHeight: Bool {
        didSet { updateCode() }
    }

    @Published var status: TextAreaStatus {
        didSet { updateCode() }
    }

    @Published var textMode: TextualContentMode {
        didSet { updateCode() }
    }

    @Published var progressVariant: CircularProgressIndicatorConfigurationModel.Variant {
        didSet { updateCode() }
    }

    @Published var progressValue: Double {
        didSet { updateCode() }
    }

    // MARK: Initializer

    override init() {
        label = defaultLabel
        placeholderText = ""
        text = ""
        helperMode = .none
        helperText = ""
        maxCharacters = 180
        errorText = defaultErrorText
        helperLinkText = ""
        textMode = .raw
        isOutlined = false
        constrainedMaxWidth = false
        constrainedMaxHeight = false
        status = .enabled
        progressVariant = .indeterminate
        progressValue = 0.0
        super.init()
    }

    deinit {}

    // MARK: Computed helper

    /// Returns the `MISOTextArea.HelperText` value to pass to the component, derived from `helperMode`.
    var computedHelperText: MISOTextArea.HelperText? {
        switch helperMode {
        case .none:
            nil
        case .plain:
            helperText.isEmpty ? nil : .plain(helperText)
        case .rich:
            helperText.isEmpty ? nil : .rich(richHelperText)
        case .charactersMaxCount:
            .charactersMaxCount(UInt16(maxCharacters))
        }
    }

    var richHelperText: AttributedString {
        do {
            return try AttributedString(markdown: helperText)
        } catch {
            return AttributedString("Supposed to be valid Markdown")
        }
    }

    // MARK: Computed status

    /// Returns the `MISOTextArea.Status` value to pass to the component
    var computedStatus: MISOTextArea.Status {
        switch status {
        case .enabled:
            .enabled
        case .error:
            .error(message: errorText)
        case .richError:
            .richError(message: richErrorText)
        case .loading:
            .loading(progress: progressVariant == .indeterminate ? nil : progressValue)
        case .readOnly:
            .readOnly
        case .disabled:
            .disabled
        }
    }

    var richErrorText: AttributedString {
        do {
            return try AttributedString(markdown: errorText)
        } catch {
            return AttributedString("Supposed to be valid Markdown")
        }
    }

    // MARK: Code illustration

    // swiftlint:disable line_length
    override func updateCode() {
        code =
            """
            MISOTextArea(\(labelPattern)\(textPattern)\(placeholderPattern)\(helperTextPattern)\(helperLinkPattern)\(outlinedPattern)\(constrainedMaxWidthPattern)\(constrainedMaxHeightPattern)\(statusPattern))
            """
    }

    // swiftlint:enable line_length

    private var labelPattern: String {
        "label: \"\(label)\""
    }

    private var textPattern: String {
        ", text: $text"
    }

    private var placeholderPattern: String {
        placeholderText.isEmpty ? "" : ", placeholder: \"\(placeholderText)\""
    }

    private var helperTextPattern: String {
        switch helperMode {
        case .none:
            ""
        case .plain:
            helperText.isEmpty ? "" : ", helperText: .plain(\"\(helperText)\")"
        case .rich:
            helperText.isEmpty ? "" : ", helperText: .rich(yourAttributedString)"
        case .charactersMaxCount:
            ", helperText: .charactersMaxCount(\(maxCharacters))"
        }
    }

    private var helperLinkPattern: String {
        helperLinkText.isEmpty ? "" : ", helperLink: .init(text: \"\(helperLinkText)\") {}"
    }

    private var outlinedPattern: String {
        isOutlined ? ", isOutlined: true" : ""
    }

    private var constrainedMaxWidthPattern: String {
        constrainedMaxWidth ? ", constrainedMaxWidth: true" : ""
    }

    private var constrainedMaxHeightPattern: String {
        constrainedMaxHeight ? ", constrainedMaxHeight: true" : ""
    }

    private var statusPattern: String {
        switch status {
        case .enabled:
            ""
        case .error:
            ", status: .error(message: \"\(errorText)\")"
        case .richError:
            ", status: .richError(message: yourAttributedString)"
        case .loading:
            if progressVariant == .indeterminate {
                ", status: .loading"
            } else {
                ", status: .loading(progress: \(String(format: "%.2f", progressValue)))"
            }
        case .readOnly:
            ", status: .readOnly"
        case .disabled:
            ", status: .disabled"
        }
    }
}

// MARK: - TextArea Configuration View

struct TextAreaConfigurationView: View {

    @StateObject var configurationModel: TextAreaConfigurationModel

    @Environment(\.theme) private var theme

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedMedium) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {

                MISOSwitchItem("app_components_common_outlined_tech", isOn: $configurationModel.isOutlined)

                MISOSwitchItem("app_components_common_constrainedMaxWidth_tech", isOn: $configurationModel.constrainedMaxWidth)

                MISOSwitchItem("app_components_common_constrainedMaxHeight_tech", isOn: $configurationModel.constrainedMaxHeight)

                MISOChipPicker(title: "app_components_common_status_tech",
                               selection: $configurationModel.status,
                               chips: TextAreaStatus.chips)

                if configurationModel.status == .loading {
                    MISOChipPicker(title: "app_components_progressIndicator_variant_tech",
                                   selection: $configurationModel.progressVariant,
                                   chips: CircularProgressIndicatorConfigurationModel.Variant.chips)

                    if configurationModel.progressVariant == .determinate {
                        DesignToolboxProgressControl(progress: $configurationModel.progressValue)
                    }
                }

                MISOChipPicker(title: "app_components_common_helperText_tech",
                               selection: $configurationModel.helperMode,
                               chips: TextAreaHelperMode.chips)

                DesignToolboxEditContentDisclosure {
                    DesignToolboxTextField(text: $configurationModel.label, label: "app_components_common_label_tech")

                    switch configurationModel.status {
                    case .error, .richError:
                        DesignToolboxTextField(text: $configurationModel.errorText, label: "app_components_textArea_errorDescription_label")
                    default:
                        switch configurationModel.helperMode {
                        case .plain, .rich:
                            DesignToolboxTextField(text: $configurationModel.helperText, label: "app_components_common_helperText_tech")
                        case .charactersMaxCount:
                            Stepper(value: $configurationModel.maxCharacters, in: 10 ... 500, step: 10) {
                                HStack {
                                    MISOLabel("app_components_textArea_maxCharacters_tech", size: .medium, weight: .strong)
                                        .foregroundColor(theme.colors.contentDefault)
                                    Spacer()
                                    MISOLabel(text: String(configurationModel.maxCharacters), size: .medium, weight: .strong)
                                        .foregroundColor(theme.colors.contentDefault)
                                }
                            }
                            .padding(.horizontal, theme.spaces.fixedMedium)
                        case .none:
                            EmptyView()
                        }
                    }

                    DesignToolboxTextField(text: $configurationModel.placeholderText, label: "app_components_common_placeholder_tech")
                    DesignToolboxTextField(text: $configurationModel.helperLinkText, label: "app_components_textArea_helperLink_tech")
                }
            }
        }
    }
}

#endif
