// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

// MARK: - Design Toolbox Enum Representable

/// Defines the option of configuration as enum representable (i.e. formated) to be used
/// in a `MISOChipPicker`. By default the `MISOChipPickerData` is built with
/// a formatted string based on the enum description.
///
/// The technical name is based on the desciption of the enum prefixed by a dot.
protocol DesignToolboxEnumRepresentable: CaseIterable, Hashable {
    /// The formatted string
    var formattedName: String { get }

    /// The technical description
    var technicalDescription: String { get }

    /// The chip data used by the `MISOChipPicker`
    var chipData: MISOChipPickerData<Self> { get }

    /// Set of chips used by `MISOChipPicker`
    static var chips: [MISOChipPickerData<Self>] { get }
}

extension DesignToolboxEnumRepresentable {
    /// Default implementation extracting words from enum raw description,
    /// and set first character in uppercase and the other in lowercase.
    var formattedName: String {
        let name = String(describing: self)
        let withSpaces = name.replacingOccurrences(
            of: "([a-z])([A-Z])",
            with: "$1 $2",
            options: .regularExpression)
        return withSpaces.prefix(1).uppercased() + withSpaces.dropFirst().lowercased()
    }

    /// Description prefixed by a dot
    var technicalDescription: String {
        ".\(String(describing: self))"
    }

    /// The data used by ``MISOChipPickerData`` based on formatted representation
    var chipData: MISOChipPickerData<Self> {
        MISOChipPickerData(tag: self, layout: .text(text: formattedName))
    }

    /// The data used by ``MISOChipPicker`` based on formatted representation
    static var chips: [MISOChipPickerData<Self>] {
        allCases.map(\.chipData)
    }
}

// MARK: - Design Toolbox Enum Localized Representable

/// Define the option of configuration as enum representable based on Localized String Keys
protocol DesignToolboxEnumLocalizedRepresentable: DesignToolboxEnumRepresentable {
    var wordingKey: String { get }
}

extension DesignToolboxEnumLocalizedRepresentable {

    /// Alternative implementation of the `MISOChipPickerData` based on
    /// description that represents a wording key.
    var chipData: MISOChipPickerData<Self> {
        MISOChipPickerData(tag: self, layout: .text(text: wordingKey.localized()))
    }
}
