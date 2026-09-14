// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI
import Testing

/// Some tests on Image extensions boilerplates
struct ImageExtensionsTests {

    @Test func defaultImageSample() {
        #expect(Image.defaultImageSample() == "Image(decorative: \"tips-and-tricks\")")
    }
}
