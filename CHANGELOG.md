# MISO iOS design toolbox changelog

All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased](https://github.com/pylapp/miso-ios/releases/compare/1.1.0...develop)

### Added

- [Library] `text area` component `textual` helper text and `textualError` status with `OUDSTextualContent` parameter for raw, localized and attributed strings (Orange-OpenSource/ouds-ios#1797)
- [Library] `password input` components init with `OUDSTextualContent` parameter for raw, localized and attributed strings in `helperText` (Orange-OpenSource/ouds-ios#1797)
- [Library] `text input` components init with `OUDSTextualContent` parameter for raw, localized and attributed strings in `helperText`, and `textualError` status (Orange-OpenSource/ouds-ios#1797)
- [Library] `PIN code input` component init with `OUDSTextualContent` parameter for raw, localized and attributed strings in `helperText`, and `textualError` status (Orange-OpenSource/ouds-ios#1797)
- [Library] `checkbox item indeterminate` components init with `OUDSTextualContent` parameter for raw, localized and attributed strings in `errorText` (Orange-OpenSource/ouds-ios#1797)
- [Library] `radio item` components init with `OUDSTextualContent` parameter for raw, localized and attributed strings in `errorText` (Orange-OpenSource/ouds-ios#1797)
- [Library] `checkbox item` components init with `OUDSTextualContent` parameter for raw, localized and attributed strings in `errorText` (Orange-OpenSource/ouds-ios#1797)
- [Library] `switch item` components init with `OUDSTextualContent` parameter for raw, localized and attributed strings in `errorText` (Orange-OpenSource/ouds-ios#1797)
- [Library] `alert message` components init with `OUDSTextualContent` parameter for raw, localized and attributed strings (Orange-OpenSource/ouds-ios#1797)
- [Library] `bullet list` components init with `OUDSTextualContent` parameter for raw, localized and attributed strings (Orange-OpenSource/ouds-ios#1797)
- [Library] `list item` components inits with `OUDSTextualContent` parameters for raw and attributed strings (Orange-OpenSource/ouds-ios#1812)
- [Library] Flag to display full value instead of bullets in `PIN code input` component (Orange-OpenSource/ouds-ios#1762)
- [Library] `Tuning` parameter for Orange, Orange Compact, Wireframe and White Label themes Xcode previews (Orange-OpenSource/ouds-ios#1793)
- [Library] Tool to detect public API breakings (Orange-OpenSource/ouds-ios#1800)
- [Library] `list item` components inits with `OUDSTextualContent` parameters for raw and attributed strings (Orange-OpenSource/ouds-ios#1812)
- [Library] `skeleton` on components (Orange-OpenSource/ouds-ios#1651)
- [Library] `categorical tag` component (Orange-OpenSource/ouds-ios#1782)

### Changed

- [DesignToolbox] List of colors for `colored surface` component
- [Library] **BREAKING**: Update protocol `ColorModeMultipleSemanticTokens` with missing tokens
- [Library] `button` component to version v3.4.0 (Orange-OpenSource/ouds-ios#1653)
- [Library] `list item` component to version v1.2.0 (Orange-OpenSource/ouds-ios#1714)
- [Library] Availability details for Apple platforms on public API (Orange-OpenSource/ouds-ios#1815) 
- [Library] Documentation for some components with DSM hyperlinks (Orange-OpenSource/ouds-ios#1813)
- [Library] `typography` component to version v1.1.0 (Orange-OpenSource/ouds-ios#1722)
- [Library] `alert message` component to version v1.2.0 (Orange-OpenSource/ouds-ios#1659)

### Fixed

- [Library] For `text input` component, the label is duplicated if on two lines (Orange-OpenSource/ouds-ios#1763)
- [DesignToolbox] Code samples for `alert message` component (Orange-OpenSource/ouds-ios#1775)
- [Library] **BREAKING**: missing `maxWidthBoxedText` token in `SizeMultipleSemanticTokens` (Orange-OpenSource/ouds-ios#1714)

## [1.1.0](https://github.com/pylapp/miso-ios-demo/releases/compare/1.0.0..1.1.0) - 2026-09-22

### Added

- [Library] Onboarding view
- [Library] Splash screen component
- [Library] Developer details in app details view in AppServices module 
- [Library] App details view in AppServices module 
- [Library] Conffetti view in AppServices module
- [Library] View to display legal information in AppServices module
- [Library] App Store update check in AppServices module
- [Library] `FoxyRough` theme

## [1.0.0](https://github.com/pylapp/miso-ios-demo/releases/tag/1.0.0) - 2026-09-16

### Changed
    
- Migration from MISO iOS codebase to MISO iOS

