// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

#if DEBUG
import Foundation

/// User defaults keys shared between the sandbox surfaces (`AboutPage` toggle
/// and `MainView` tab bar).
enum SandboxUserDefaultsKeys {

    /// Key backing the "Bac à sable" switch item in the About page.
    /// Persisted with reverse-DNS notation like other global demo-app flags.
    static let sandboxEnabled = "info.pylapp.miso.demoapp.sandboxEnabled"
}
#endif
