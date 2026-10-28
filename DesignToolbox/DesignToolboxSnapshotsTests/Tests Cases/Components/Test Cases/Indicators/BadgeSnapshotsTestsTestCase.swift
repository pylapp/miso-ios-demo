// Software: MISO iOS (demo app)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Pierre-Yves Lapersonne
// ✿✿✿✿ ʕ •ᴥ•ʔ/ ︻デ═一

import MISOSwiftUI
import SnapshotTesting
import SwiftUI
import XCTest

// swiftlint:disable required_deinit

// MARK: - Test Cases

/// Tests the UI rendering of the `MISOBadgeStandard`, `MISOBadgeIcon` and `MISOBadgeCount` for each parameter
///
/// To limit the amount of reference images, badges being tiny illustrations:
///   - `MISOBadgeStandard`: the `status` (6 values) and `size` (4 values) axes are gathered into a single
///     ``SnapshotGrid`` (24 cells).
///   - `MISOBadgeCount`: the `status` (6 values) and `size` (2 values) axes are gathered into a single
///     ``SnapshotGrid`` (12 cells).
///   - `MISOBadgeIcon`: the `statusIcon` axis (image/tintedIcon) is kept as a separate file since it changes
///     the nature of the rendered glyph; the `statusKind` (6 values) and `size` (4 values) axes are gathered
///     into a single ``SnapshotGrid`` per `statusIcon` (24 cells).
/// Each cell of a grid carries a short caption so a regression stays identifiable directly in the resulting
/// image. See `SnapshotGrid.swift`.
open class BadgeSnapshotsTestsTestCase: XCTestCase {

    /// The number of columns used to lay out the `MISOBadgeStandard` and `MISOBadgeIcon` grids, so each row
    /// shows all sizes of one single status (one row per status).
    private static let standardAndIconGridColumns = MISOBadgeStandard.Size.allCases.count

    /// The number of columns used to lay out the `MISOBadgeCount` grid, so each row shows all sizes of one
    /// single status (one row per status).
    private static let countGridColumns = MISOBadgeCount.Size.allCases.count

    /// Fixed size applied to each cell of the `MISOBadgeStandard` grid.
    private static let standardCellSize = CGSize(width: 80, height: 60)

    /// Fixed size applied to each cell of the `MISOBadgeIcon` grid.
    private static let iconCellSize = CGSize(width: 80, height: 70)

    /// Fixed size applied to each cell of the `MISOBadgeCount` grid.
    private static let countCellSize = CGSize(width: 100, height: 60)

    /// This function tests all badges with all types, status and size for the given theme and color scheme.
    ///
    /// It iterates through the axes which are kept as separate files, gathering the other axes into grids.
    ///
    /// - Parameters:
    ///   - theme: The theme (`MISOTheme`) from which to retrieve color tokens.
    ///   - interfaceStyle: The user interface style (light or dark) for which to test the colors.
    @MainActor func testAllBadges(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        testBadgeStandardGrid(theme: theme, interfaceStyle: interfaceStyle)
        testBadgeCountGrid(theme: theme, interfaceStyle: interfaceStyle)
        for statusIcon in DefinedStatusIcons.allCases {
            testBadgeIconGrid(theme: theme, interfaceStyle: interfaceStyle, statusIcon: statusIcon)
        }
    }

    // MARK: - MISOBadgeStandard

    /// Builds the grid cell for a given `MISOBadgeStandard` status and size.
    @MainActor private func badgeStandardCell(
        status: MISOBadgeStandard.Status,
        size: MISOBadgeStandard.Size,
        theme: MISOTheme) -> SnapshotGridCell<AnyView>
    {
        let model = BadgeStandardConfigurationModel()
        model.status = status
        model.standardSize = size
        return SnapshotGridCell(caption: "\(status.technicalDescription)\n\(size.technicalDescription)") {
            AnyView(
                MISOThemeableView(theme: theme) {
                    BadgeStandardDemo(configurationModel: model)
                })
        }
    }

    /// Builds a ``SnapshotGrid`` gathering all `status` and `size` values of `MISOBadgeStandard`,
    /// then captures it in a single snapshot.
    ///
    /// - Parameters:
    ///   - theme: The theme (MISOTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    @MainActor private func testBadgeStandardGrid(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let cells = MISOBadgeStandard.Status.allCases.flatMap { status in
            MISOBadgeStandard.Size.allCases.map { size in
                badgeStandardCell(status: status, size: size, theme: theme)
            }
        }

        let testName = "testBadge_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "StandardBadge"

        let grid = SnapshotGrid(
            columns: Self.standardAndIconGridColumns,
            cellSize: Self.standardCellSize,
            cells: cells,
            title: "\(testName).\(name)")

        let illustration = MISOThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    // MARK: - MISOBadgeIcon

    /// Builds the grid cell for a given `MISOBadgeIcon` status kind, size and status icon.
    @MainActor private func badgeIconCell(
        statusKind: BadgeIconStatusKind,
        size: MISOBadgeStandard.Size,
        statusIcon: DefinedStatusIcons,
        theme: MISOTheme) -> SnapshotGridCell<AnyView>
    {
        let model = BadgeIconConfigurationModel()
        model.statusKind = statusKind
        model.size = size
        model.statusIcon = statusIcon
        return SnapshotGridCell(caption: "\(statusKind.technicalDescription)\n\(size.technicalDescription)") {
            AnyView(
                MISOThemeableView(theme: theme) {
                    BadgeIconDemo(configurationModel: model)
                })
        }
    }

    /// Builds a ``SnapshotGrid`` gathering all `statusKind` and `size` values of `MISOBadgeIcon` for a given
    /// `statusIcon`, then captures it in a single snapshot.
    ///
    /// The snapshot is saved with a name based on the parameter which is not folded into the grid:
    ///    testBadge_<themeName>_<colorScheme>.IconBadge-<statusIcon>
    ///
    /// - Parameters:
    ///   - theme: The theme (MISOTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    ///   - statusIcon: The status icon kind (image or tintedIcon)
    @MainActor private func testBadgeIconGrid(theme: MISOTheme,
                                              interfaceStyle: UIUserInterfaceStyle,
                                              statusIcon: DefinedStatusIcons)
    {
        let cells = BadgeIconStatusKind.allCases.flatMap { statusKind in
            MISOBadgeStandard.Size.allCases.map { size in
                badgeIconCell(statusKind: statusKind, size: size, statusIcon: statusIcon, theme: theme)
            }
        }

        let testName = "testBadge_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "IconBadge-\(statusIcon.technicalDescription)"

        let grid = SnapshotGrid(
            columns: Self.standardAndIconGridColumns,
            cellSize: Self.iconCellSize,
            cells: cells,
            title: "\(testName).\(name)")

        let illustration = MISOThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }

    // MARK: - MISOBadgeCount

    /// Builds the grid cell for a given `MISOBadgeCount` status and size.
    @MainActor private func badgeCountCell(
        status: MISOBadgeStandard.Status,
        size: MISOBadgeCount.Size,
        theme: MISOTheme) -> SnapshotGridCell<AnyView>
    {
        let model = BadgeCountConfigurationModel()
        model.status = status
        model.countSize = size
        model.countText = "100"
        return SnapshotGridCell(caption: "\(status.technicalDescription)\n\(size.technicalDescription)") {
            AnyView(
                MISOThemeableView(theme: theme) {
                    BadgeCountDemo(configurationModel: model)
                })
        }
    }

    /// Builds a ``SnapshotGrid`` gathering all `status` and `size` values of `MISOBadgeCount`,
    /// then captures it in a single snapshot.
    ///
    /// - Parameters:
    ///   - theme: The theme (MISOTheme)
    ///   - interfaceStyle: The user interface style (light or dark)
    @MainActor private func testBadgeCountGrid(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let cells = MISOBadgeStandard.Status.allCases.flatMap { status in
            MISOBadgeCount.Size.allCases.map { size in
                badgeCountCell(status: status, size: size, theme: theme)
            }
        }

        let testName = "testBadge_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"
        let name = "CountBadge"

        let grid = SnapshotGrid(
            columns: Self.countGridColumns,
            cellSize: Self.countCellSize,
            cells: cells,
            title: "\(testName).\(name)")

        let illustration = MISOThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: name,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit
