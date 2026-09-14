// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import XCTest

// swiftlint:disable required_deinit

/// To make UI tests on `MISORadio` to test some a11y configurations.
final class RadioUITests: AppTestCase {

    /// Check the a11y configurations of the radio item depending to its state
    @MainActor func testRadioA11yConfigurations() throws {

        // 'Radio button. Selected. . '
        let selectedRadioA11YValue = wording(for: "core_radio_trait_a11y") + ". " + wording(for: "core_common_selected_a11y") + ". . "
        // 'Radio button. Unselected. . '
        let unselectedRadioA11YValue = wording(for: "core_radio_trait_a11y") + ". " + wording(for: "core_common_unselected_a11y") + ". . "

        // GIVEN

        let app = launchApp()
        goToComponentsSheet(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        tapButton(withWording: "app_components_radioButton_tech", app)
        tapButton(withWording: "app_components_radioButton_tech", app)

        let radio = otherElements(withA11yIdentifier: A11YIdentifiers.componentRadio, app).firstMatch
        XCTAssertTrue(radio.exists)
        check(value: unselectedRadioA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentRadio, app)

        // WHEN

        tapOtherElement(withA11yIdentifier: A11YIdentifiers.configurationSwitchSelection, app)
        wait(1)

        // THEN

        check(value: selectedRadioA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentRadio, app)

        // WHEN

        tapOtherElement(withA11yIdentifier: A11YIdentifiers.configurationSwitchSelection, app)
        wait(1)

        // THEN

        check(value: unselectedRadioA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentRadio, app)
    }

    // TODO: Test hints and labels
}

// swiftlint:enable required_deinit
