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

/// Tests the UI rendering of the `MISODisplay`, `MISOHeading`, `MISOBody`, `MISOLabel` and `MISOCode`
/// typography components for each parameter.
///
/// To limit the amount of reference images, each typography family is folded into a single
/// ``SnapshotGrid`` (one assertion = one reference image per theme-scheme):
///   - `Display.png`: 1 column × N rows, one per `MISODisplay.Size`.
///   - `Heading.png`: 1 column × N rows, one per `MISOHeading.Size` + the "with marker" variant for `.large`
///     + the "colored substring" variant.
///   - `Body.png`: 3 columns `MISOBody.Weight` × N rows `MISOBody.Size`.
///   - `Label.png`: 3 columns `MISOLabel.Weight` × N rows `MISOLabel.Size`.
///   - `Code.png`: single-cell grid.
///
/// Total: 5 files per theme-scheme instead of ~31.
open class TypographySnapshotsTestsTestCase: XCTestCase {

    @MainActor func testAllTypography(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        testAllDisplays(theme: theme, interfaceStyle: interfaceStyle)
        testAllHeadings(theme: theme, interfaceStyle: interfaceStyle)
        testAllBodies(theme: theme, interfaceStyle: interfaceStyle)
        testAllLabels(theme: theme, interfaceStyle: interfaceStyle)
        testCode(theme: theme, interfaceStyle: interfaceStyle)
    }

    // MARK: - Display

    @MainActor func testAllDisplays(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let sizes = MISODisplay.Size.allCases

        var cells: [SnapshotGridCell<AnyView>] = []
        for size in sizes {
            cells.append(SnapshotGridCell(caption: "size\(size.technicalDescription)") {
                AnyView(
                    MISOThemeableView(theme: theme) {
                        MISODisplay(text: "Display", size: size)
                    })
            })
        }

        emit(theme: theme,
             interfaceStyle: interfaceStyle,
             snapshotName: "Display",
             columns: 1,
             cellSize: CGSize(width: 420, height: 140),
             cells: cells)
    }

    // MARK: - Heading

    @MainActor func testAllHeadings(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let sizes = MISOHeading.Size.allCases

        var cells: [SnapshotGridCell<AnyView>] = []
        for size in sizes {
            cells.append(SnapshotGridCell(caption: "size\(size.technicalDescription)") {
                AnyView(
                    MISOThemeableView(theme: theme) {
                        MISOHeading(text: "Heading", size: size, hasMarker: false)
                    })
            })
        }
        // The marker is only honored for `size == .large` and when the theme supports it.
        cells.append(SnapshotGridCell(caption: "size.large\nmarker") {
            AnyView(
                MISOThemeableView(theme: theme) {
                    MISOHeading(text: "Heading", size: .large, hasMarker: true)
                })
        })
        // The colored substring is only meaningful for `size == .large`.
        cells.append(SnapshotGridCell(caption: "coloredSubstring") {
            AnyView(
                MISOThemeableView(theme: theme) {
                    MISOHeading(text: "Welcome to MISO", coloredText: "MISO")
                })
        })

        emit(theme: theme,
             interfaceStyle: interfaceStyle,
             snapshotName: "Heading",
             columns: 1,
             cellSize: CGSize(width: 420, height: 110),
             cells: cells)
    }

    // MARK: - Body

    @MainActor func testAllBodies(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let sizes = MISOBody.Size.allCases
        let weights = MISOBody.Weight.allCases

        var cells: [SnapshotGridCell<AnyView>] = []
        for size in sizes {
            for weight in weights {
                cells.append(SnapshotGridCell(caption: "\(size.technicalDescription)\n\(weight.technicalDescription)") {
                    AnyView(
                        MISOThemeableView(theme: theme) {
                            MISOBody(text: "Body", size: size, weight: weight)
                        })
                })
            }
        }

        emit(theme: theme,
             interfaceStyle: interfaceStyle,
             snapshotName: "Body",
             columns: weights.count,
             cellSize: CGSize(width: 260, height: 80),
             cells: cells)
    }

    // MARK: - Label

    @MainActor func testAllLabels(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let sizes = MISOLabel.Size.allCases
        let weights = MISOLabel.Weight.allCases

        var cells: [SnapshotGridCell<AnyView>] = []
        for size in sizes {
            for weight in weights {
                cells.append(SnapshotGridCell(caption: "\(size.technicalDescription)\n\(weight.technicalDescription)") {
                    AnyView(
                        MISOThemeableView(theme: theme) {
                            MISOLabel(text: "Label", size: size, weight: weight)
                        })
                })
            }
        }

        emit(theme: theme,
             interfaceStyle: interfaceStyle,
             snapshotName: "Label",
             columns: weights.count,
             cellSize: CGSize(width: 260, height: 60),
             cells: cells)
    }

    // MARK: - Code

    @MainActor func testCode(theme: MISOTheme, interfaceStyle: UIUserInterfaceStyle) {
        let cells: [SnapshotGridCell<AnyView>] = [
            SnapshotGridCell(caption: "code") {
                AnyView(
                    MISOThemeableView(theme: theme) {
                        MISOCode(text: "let x = 42")
                    })
            },
        ]

        emit(theme: theme,
             interfaceStyle: interfaceStyle,
             snapshotName: "Code",
             columns: 1,
             cellSize: CGSize(width: 320, height: 60),
             cells: cells)
    }

    // MARK: - Emit helper

    @MainActor private func emit(theme: MISOTheme,
                                 interfaceStyle: UIUserInterfaceStyle,
                                 snapshotName: String,
                                 columns: Int,
                                 cellSize: CGSize,
                                 cells: [SnapshotGridCell<AnyView>])
    {
        let testName = "testTypography_\(theme.name)Theme_\(interfaceStyle == .light ? "Light" : "Dark")"

        let grid = SnapshotGrid(
            columns: columns,
            cellSize: cellSize,
            cells: cells,
            title: "\(testName).\(snapshotName)",
            cellSpacing: 24,
            rowSpacing: 24)

        let illustration = MISOThemeableView(theme: theme) {
            grid
                .background(theme.colors.bgPrimary.color(for: interfaceStyle == .light ? .light : .dark))
        }

        assertIllustration(illustration,
                           on: interfaceStyle,
                           named: snapshotName,
                           testName: testName)
    }
}

// swiftlint:enable required_deinit
