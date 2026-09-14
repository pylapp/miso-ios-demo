// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import SwiftUI

/// Drives the "update available" alert presented at app launch.
///
/// Performs a single check against the iTunes lookup API on initialisation and
/// publishes the result so that any SwiftUI view can observe it.
@MainActor
final class AppStoreUpdateViewModel: ObservableObject {

    // MARK: - Properties

    /// `true` when a newer version is available and the alert should be displayed, `false` otherwise
    @Published var showUpdateAlert: Bool = false

    /// The update information fetched from the App Store (populated before `showUpdateAlert` flips to `true`).
    private(set) var updateInfo: AppStoreUpdateInfo?

    // MARK: - Initialisation

    init() {
        Task {
            await checkForUpdate()
        }
    }

    deinit {}

    // MARK: - Service

    /// Manually triggers an App Store version check.
    /// Called automatically at init; can also be called from tests or previews.
    func checkForUpdate() async {
        let info = await AppStoreUpdateService.checkForUpdate()
        if let info {
            updateInfo = info
            showUpdateAlert = true
        }
    }

    // MARK: - Helpers

    /// Formatted alert title including the remote version number.
    var alertTitle: String {
        let version = updateInfo?.version ?? ""
        return String(format: String(localized: "app_update_alert_title"), version)
    }

    /// Alert body: release notes when available, fallback generic message otherwise.
    var alertMessage: String {
        if let notes = updateInfo?.releaseNotes, !notes.isEmpty {
            // Truncate long changelogs so the alert stays readable.
            let limit = 300
            if notes.count > limit {
                return String(notes.prefix(limit)) + "…"
            }
            return notes
        }
        return String(localized: "app_update_alert_message_fallback")
    }

    /// The App Store URL for the "App Store" button action.
    var appStoreURL: URL? {
        updateInfo?.appStoreURL
    }
}
