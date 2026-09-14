// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import Foundation

/// Holds information about an available App Store update.
struct AppStoreUpdateInfo {

    /// The version string available on the App Store (e.g. "2.3.0").
    let version: String

    /// The release notes returned by the iTunes lookup API (may be nil or empty).
    let releaseNotes: String?

    /// The direct App Store URL to open when the user taps the dedicated button.
    let appStoreURL: URL
}
