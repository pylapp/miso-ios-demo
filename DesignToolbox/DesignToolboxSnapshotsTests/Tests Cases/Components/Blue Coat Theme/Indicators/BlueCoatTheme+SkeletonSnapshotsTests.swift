// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SwiftUI

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOSkeleton` component for each parameter with `BlueCoatTheme`
@available(iOS 16.0, *)
final class BlueCoatThemeSkeletonSnapshotsTests: SkeletonSnapshotsTestsTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    private var theme: MISOTheme!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        theme = BlueCoatTheme()
    }

    /// Tests all skeletons configuration in the `BlueCoatTheme` with the `light` color schemes.
    @MainActor func testAllSkeletonsBlueCoatThemeLight() {
        let interfaceStyle = UIUserInterfaceStyle.light
        testAllSkeletons(theme: theme, interfaceStyle: interfaceStyle)
    }

    /// Tests all skeletons configuration in the `BlueCoatTheme` with the `dark` color schemes.
    @MainActor func testAllSkeletonsBlueCoatThemeDark() {
        let interfaceStyle = UIUserInterfaceStyle.dark
        testAllSkeletons(theme: theme, interfaceStyle: interfaceStyle)
    }
}

// swiftlint:enable required_deinit
