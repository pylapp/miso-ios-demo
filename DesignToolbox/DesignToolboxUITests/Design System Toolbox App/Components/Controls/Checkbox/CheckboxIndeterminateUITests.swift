// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import XCTest

// swiftlint:disable required_deinit

/// To make UI tests on `MISOCheckboxIndeterminate` to test some a11y configurations.
final class CheckboxIndeterminateUITests: AppTestCase {

    /// Check the a11y configurations of the checkbox with three values depending to its state
    @MainActor func testCheckboxIndeterminateA11yConfigurations() throws {

        // 'Checkbox. Checked. . '
        let checkedCheckboxA11YValue = wording(for: "core_checkbox_trait_a11y") + ". " + wording(for: "core_checkbox_checked_a11y") + ". . "
        // 'Checkbox. Unchecked. . '
        let uncheckedCheckboxA11YValue = wording(for: "core_checkbox_trait_a11y") + ". " + wording(for: "core_checkbox_unchecked_a11y") + ". . "
        // 'Checkbox. Indeterminate. . '
        let indeterminateCheckboxA11YValue = wording(for: "core_checkbox_trait_a11y") + ". " + wording(for: "core_checkbox_indeterminate_a11y") + ". . "

        // GIVEN

        let app = launchApp()
        goToComponentsSheet(app)
        tapButton(withWording: "app_components_checkbox_tech", app)
        tapButton(withWording: "app_components_checkbox_indeterminateCheckbox_tech", app)

        let checkbox = otherElements(withA11yIdentifier: A11YIdentifiers.componentCheckboxIndeterminate, app).firstMatch
        XCTAssertTrue(checkbox.exists)

        check(value: checkedCheckboxA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentCheckboxIndeterminate, app)

        // WHEN

        tapButton(withWording: "Unselected", app)

        // THEN

        check(value: uncheckedCheckboxA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentCheckboxIndeterminate, app)

        // WHEN

        tapButton(withWording: "Selected", app)

        // THEN

        check(value: checkedCheckboxA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentCheckboxIndeterminate, app)

        // WHEN

        tapButton(withWording: "Indeterminate", app)

        // THEN

        check(value: indeterminateCheckboxA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentCheckboxIndeterminate, app)

        // WHEN

        checkbox.tap()

        // THEN

        check(value: checkedCheckboxA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentCheckboxIndeterminate, app)
    }

    // TODO: Test hints and labels
}

// swiftlint:enable required_deinit
