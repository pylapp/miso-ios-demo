// Software: MISO iOS (demo app) (fork of OUDS iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import Foundation
import Testing

/// Some tests on String boilerplates
struct StringTests {

    @Test func toGitHubRelease() {
        #expect("".toGitHubRelease() == "https://github.com/pylapp/miso-ios-demo/releases")
        #expect("123".toGitHubRelease() == "https://github.com/pylapp/miso-ios-demo/releases")
        #expect("4.5.6".toGitHubRelease() == "https://github.com/pylapp/miso-ios-demo/releases/tag/4.5.6")
    }

    @Test func toGitHubBuild() {
        #expect("".toGitHubBuild() == "https://github.com/pylapp/miso-ios")
        #expect("stable".toGitHubBuild() == "https://github.com/pylapp/miso-ios/tree/main")
        #expect("beta (nightly) (abcdefg)".toGitHubBuild() == "https://github.com/pylapp/miso-ios-demo/commit/abcdefg")
        #expect("alpha (abcdefg)".toGitHubBuild() == "https://github.com/pylapp/miso-ios-demo/commit/abcdefg")
    }

    @Test func toGitHubIssues() {
        #expect("123".toGitHubIssues()[0] == "https://github.com/pylapp/miso-ios/issues/123")
        #expect("123, 456, 789".toGitHubIssues()[0] == "https://github.com/pylapp/miso-ios/issues/123")
        #expect("123, 456, 789".toGitHubIssues()[1] == "https://github.com/pylapp/miso-ios/issues/456")
        #expect("123, 456, 789".toGitHubIssues()[2] == "https://github.com/pylapp/miso-ios/issues/789")
    }

    @Test func toGitHubIssue() {
        #expect("123".toGitHubIssue() == "https://github.com/pylapp/miso-ios/issues/123")
        #expect("".toGitHubIssue() == "https://github.com/pylapp/miso-ios/issues/")
    }

    @Test func toGitHubVersion() {
        #expect("407-foo-bar-wizz".toGitHubVersion() == "https://github.com/pylapp/miso-ios/tree/407-foo-bar-wizz")
        #expect("develop".toGitHubVersion() == "https://github.com/pylapp/miso-ios/tree/develop")
        #expect("some (abcdefg)".toGitHubVersion() == "https://github.com/pylapp/miso-ios/commit/abcdefg")
        #expect("".toGitHubVersion() == "https://github.com/pylapp/miso-ios/tree/main")
    }
}
