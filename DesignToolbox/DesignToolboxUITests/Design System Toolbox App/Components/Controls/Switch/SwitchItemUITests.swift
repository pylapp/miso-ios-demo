// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import XCTest

// swiftlint:disable required_deinit

/// To make UI tests on `MISOSwitchItem` to test some a11y configurations.
final class SwitchItemUITests: AppTestCase {

    /// Check the a11y configurations of the switch depending to its state
    @MainActor func testSwitchItemA11yConfigurations() throws {

        // 'Switch button. Selected. .'
        let selectedSwitchA11YValue = wording(for: "core_switch_trait_a11y") + ". " + wording(for: "core_common_selected_a11y") + ". . "
        // 'Switch button. Unselected. .'
        let unselectedSwitchA11YValue = wording(for: "core_switch_trait_a11y") + ". " + wording(for: "core_common_unselected_a11y") + ". . "

        // GIVEN

        let app = launchApp()
        goToComponentsSheet(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        swipeFromDownToUp(app)
        tapButton(withWording: "app_components_switch_tech", app)
        waitForButtonToAppear(withWording: "app_components_switch_switchItem_tech", app)
        tapButton(withWording: "app_components_switch_switchItem_tech", app)

        let switchItem = otherElements(withA11yIdentifier: A11YIdentifiers.componentSwitchItem, app).firstMatch
        XCTAssertTrue(switchItem.exists)
        check(value: selectedSwitchA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentSwitchItem, app)

        // WHEN

        tapOtherElement(withA11yIdentifier: A11YIdentifiers.configurationSwitchSelection, app)
        wait(1)

        // THEN

        check(value: unselectedSwitchA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentSwitchItem, app)

        // WHEN

        tapOtherElement(withA11yIdentifier: A11YIdentifiers.configurationSwitchSelection, app)
        wait(1)

        // THEN

        check(value: selectedSwitchA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentSwitchItem, app)

        // WHEN

        tapOtherElement(withA11yIdentifier: A11YIdentifiers.configurationSwitchSelection, app)
        wait(1)

        // THEN

        check(value: unselectedSwitchA11YValue, ofElementWithIdentifier: A11YIdentifiers.componentSwitchItem, app)
    }

    // TODO: Test hints and labels
}

// swiftlint:enable required_deinit
