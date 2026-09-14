// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import XCTest

// swiftlint:disable required_deinit

/// To make UI tests on `MISOCheckboxItem` to test some a11y configurations.
final class CheckboxItemUITests: AppTestCase {

    /// Check the a11y configurations of the checkbox depending to its state
    @MainActor func testCheckboxItemA11yConfigurations() throws {

        // 'Checkbox. Checked. . '
        let checkedCheckboxA11YValue = wording(for: "core_checkbox_trait_a11y") + ". " + wording(for: "core_checkbox_checked_a11y") + ". . "
        // 'Checkbox. Unchecked. . '
        let uncheckedCheckboxA11YValue = wording(for: "core_checkbox_trait_a11y") + ". " + wording(for: "core_checkbox_unchecked_a11y") + ". . "

        // GIVEN

        let app = launchApp()
        goToComponentsSheet(app)
        tapButton(withWording: "app_components_checkbox_tech", app)
        waitForButtonToAppear(withWording: "app_components_checkbox_checkboxItem_tech", app)
        tapButton(withWording: "app_components_checkbox_checkboxItem_tech", app)

        let checkbox = otherElements(withA11yIdentifier: A11YIdentifiers.componentCheckboxItem, app).firstMatch
        XCTAssertTrue(checkbox.exists)
        check(value: checkedCheckboxA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentCheckboxItem, app)

        // WHEN

        tapOtherElement(withA11yIdentifier: A11YIdentifiers.configurationSwitchSelection, app)
        wait(1)

        // THEN

        check(value: uncheckedCheckboxA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentCheckboxItem, app)

        // WHEN

        tapOtherElement(withA11yIdentifier: A11YIdentifiers.configurationSwitchSelection, app)
        wait(1)

        // THEN

        check(value: checkedCheckboxA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentCheckboxItem, app)
    }

    // TODO: Test hints and labels
}

// swiftlint:enable required_deinit
