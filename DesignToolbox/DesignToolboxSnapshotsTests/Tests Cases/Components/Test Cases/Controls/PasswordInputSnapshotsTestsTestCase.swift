// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

// MARK: - Test Cases

// swiftlint:disable required_deinit

/// Tests the UI rendering of the `MISOPasswordInput` for each parameter
open class PasswordInputSnapshotsTestsTestCase: XCTestCase {

    /// This function tests some Password input configuration for the given theme and color schemes on a standard surface.
    ///
    /// **/!\ It does not test the hover and pressed states.**
    ///
    /// It iterates through all combinations of configuration:
    /// - the outline
    /// - the the lock icon
    /// - status of the text input (the loader is dropped still the progress indicator is done)
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllPasswordInputs(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        for outlined in [true, false] {
            for lockIcon in [true, false] {
                for status in MISOTextInput.Status.allCases {
                    testPasswordInput(theme: theme,
                                      interfaceStyle: interfaceStyle,
                                      lockIcon: lockIcon,
                                      status: status,
                                      outlined: outlined)
                }
            }
        }
    }

    /// This function tests some Password input configuration for the given theme and color schemes on a standard surface.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    ///   - lockIcon: to add the lock Icon
    ///   - status: the status of the text input
    ///   - outlined: flag to know if outlined
    @MainActor private func testPasswordInput(theme: MISOTheme,
                                              interfaceStyle: UIUserInterfaceStyle,
                                              lockIcon: Bool,
                                              status: MISOTextInput.Status,
                                              outlined: Bool)
    {
        // Generate the illustration for configuration elements
        let illustration = MISOThemeableView(theme: theme) {
            TestPasswordInputView(lockIcon: lockIcon,
                                  status: status,
                                  outlined: outlined)
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        // Create a unique snapshot name based on the current configuration :
        // test<testType>_<themeName>_<colorScheme>.<roundedPattern><stylePattern><statusPattern>
        let testName = "test_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let lockIconPattern = lockIcon ? "LockIcon" : ""
        let outlinedPattern = outlined ? "_Outlined" : ""
        let statusPattern = status.technicalDescription.contains("error") ? "error" : status.technicalDescription

        let named = "\(lockIconPattern)\(outlinedPattern)\(statusPattern)"

        // Capture the snapshot of the illustration with the correct user interface style and save it with the snapshot name
        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: named,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit

struct TestPasswordInputView: View {

    // MARK: - Stored properties

    let lockIcon: Bool
    let status: MISOTextInput.Status
    let outlined: Bool

    @State private var password = ""

    // MARK: - Body

    var body: some View {
        VStack {
            MISOPasswordInput(label: "Password",
                              password: $password,
                              lockIcon: lockIcon,
                              isOutlined: outlined,
                              status: status)

            MISOPasswordInput(label: "Password",
                              password: $password,
                              placeholder: "Placeholder",
                              prefix: "CORP-",
                              lockIcon: lockIcon,
                              helperText: "Helper text.",
                              isOutlined: outlined,
                              status: status)
        }
        .padding()
    }
}
