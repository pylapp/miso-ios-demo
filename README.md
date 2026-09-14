<p align="center">
<img src="./images/logo-MISO.png" alt="Logo of MISO tool" height="150" />
</p>

<h1 align="center">MISO iOS</h1>

<p align="center">
  🍜 MISO is a library of SwiftUI components (forked from ouds-ios), themes and tools for iOS app development.
  <br>
  🐙 Miso Is So {Open | Obvious | Original}
  <br>
  <a href="https://github.com/pylapp/miso-ios/issues/new?template=bug_report.yml" title="Open an issue on GitHub">Report bug</a>
  ·
  <a href="https://github.com/pylapp/miso-ios/wiki" title="Swift library wiki">Wiki</a>
  ·
  <a href="https://github.com/pylapp/miso-ios-design-system-toolbox" title="Design system toolbox GitHub project of MISO">Design system toolbox</a>
</p>

<p align="center">
<a href="https://github.com/pylapp/miso-ios-design-system-toolbox/actions/workflows/build-and-test.yml" title="Build and test status"><img src="https://github.com/pylapp/miso-ios-design-system-toolbox/actions/workflows/build-and-test.yml/badge.svg" alt="Build and test status"></a>
&nbsp;
<a href="https://github.com/pylapp/miso-ios-design-system-toolbox/actions/workflows/gitleaks.yml" title="Gitleaks status"><img src="https://github.com/pylapp/miso-ios-design-system-toolbox/actions/workflows/gitleaks.yml/badge.svg" alt="Gitleaks status"></a>
&nbsp;
<a href="https://github.com/pylapp/miso-ios-design-system-toolbox/actions/workflows/swiftpolyglot.yml" title="SwiftPolyglot status"><img src="https://github.com/pylapp/miso-ios-design-system-toolbox/actions/workflows/swiftpolyglot.yml/badge.svg" alt="SwiftPolyglot status"></a>
&nbsp;
<a href="https://github.com/pylapp/miso-ios-design-system-toolbox/actions/workflows/swiftlint.yml" title="SwiftLint status"><img src="https://github.com/pylapp/miso-ios-design-system-toolbox/actions/workflows/swiftlint.yml/badge.svg" alt="SwiftLint status"></a>
&nbsp;
<a href="https://scorecard.dev/viewer/?uri=github.com/pylapp/miso-ios-design-system-toolbox" title="OpenSSF Scorecard"><img src="https://api.scorecard.dev/projects/github.com/pylapp/miso-ios-design-system-toolbox/badge" alt="OpenSSF Scorecard"></a>  
&nbsp;
<a href="https://renovatebot.com" title="Renovate status"><img src="https://img.shields.io/badge/renovate-enabled-brightgreen.svg" alt="Renovate status"></a>
</p>

## ⚙️ Status

[![MIT license](https://img.shields.io/github/license/pylapp/miso-ios-design-system-toolbox?style=for-the-badge)](https://github.com/pylapp/miso-ios-design-system-toolbox/blob/main/LICENSE)

[![Versions](https://img.shields.io/github/v/release/pylapp/miso-ios-design-system-toolbox?label=Last%20version&style=for-the-badge)](https://github.com/pylapp/miso-ios-design-system-toolbox/releases)
[![Still maintained](https://img.shields.io/maintenance/yes/2026?style=for-the-badge)](https://github.com/Orange-OpenSource/ouds-ios/issues?q=is%3Aissue+is%3Aclosed)

[![Xcode 26.](https://img.shields.io/badge/Xcode-26.-blue?style=for-the-badge)](https://developer.apple.com/documentation/xcode-release-notes/xcode-26_-release-notes)

![iOS 15.0](https://img.shields.io/badge/iOS-15.0-FF1AB2?style=for-the-badge)
![iPadOS 15.0](https://img.shields.io/badge/iPadOS-15.0-FF1AB2?style=for-the-badge)
![macOS 15.0](https://img.shields.io/badge/macOS-15.0-FF1AB2?style=for-the-badge)
![visionOS 1.3](https://img.shields.io/badge/visionOS-1.3-FF1AB2?style=for-the-badge)
![watchOS 11.6](https://img.shields.io/badge/watchOS-11.6-FF1AB2?style=for-the-badge)
![tvOS 16.6](https://img.shields.io/badge/tvOS-16.6-FF1AB2?style=for-the-badge)

## 📦 Content

Source code of the app showcasing the design system for iOS, iPadOS, macOS, visionOS, watchOS and tvOS.

> [!NOTE]
> The source code of the [Swift Package is on pylapp/miso-ios](https://github.com/pylapp/miso-ios).

> [!TIP]
> Releases are immutable and in most of time cryptographically signed.
> You can verify integrity of release and assets with commands below
> using [GitHub CLI](https://cli.github.com/) 
> and available [release tags](https://github.com/pylapp/miso-ios-design-system-toolbox/releases).

To verify integrity of a release *x.y.z*:
```shell
gh release verify x.y.z --repo pylapp/miso-ios-design-system-toolbox
```

To verify integrity of an *asset* (previously downloaded at current location) associated to the release *x.y.z*:
```shell
gh release verify-asset x.y.z asset --repo pylapp/miso-ios-design-system-toolbox
```

For these commands a message should say release is verified or asset verification succeeded.

## 🪲 Bugs, feature requests and discussions

> [!CAUTION]
> So as to help management team and have in one board all issues related to OUDS iOS, 
> and because the design system toolbox app is just a mirror of the library, 
> any discussions and issues about this app, and in the end, content of this repository, 
> must remain in the [library project](https://github.com/pylapp/miso-ios).

## 🤝 Contributing

Please read through our [contributing guidelines](https://github.com/pylapp/miso-ios-design-system-toolbox/blob/main/.github/CONTRIBUTING.md). Included are directions for opening issues, coding standards, and notes on development. More technical details are available also in the [DEVELOP](https://github.com/pylapp/miso-ios-design-system-toolbox/blob/main/.github/DEVELOP.md) file.

## ⚖️ Copyright and license

> [!IMPORTANT]
> This project is a fork from [Orange-OpenSource/ouds-ios-design-system-toolbox](https://github.com/Orange-OpenSource/ouds-ios-design-system-toolbox),
> but without Orange and Sosh brand themes,
> with a renamed API to not use the "OUDS" acronym,
> and with an opened Wireframe theme using other icons (here extracted from SF Symbols).
> The architecture is the same as OUDS v3.0.0.

Code released under the [MIT License](https://github.com/pylapp/miso-ios/blob/main/LICENSE).

> [!NOTE]
> Copyright Orange SA (for OUDS specific elements)

> [!NOTE]
> Copyright Pierre-Yves Lapersonne (for MISO)
