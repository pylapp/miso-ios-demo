// Software: MISO iOS (demo app) (fork of MISO iOS Design System Toolbox)
// SPDX-License-Identifier: MIT
// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne

import MISOSwiftUI
import SwiftUI

struct CategoricalTagView: View {

    var body: some View {
        WatchScrollLayoutView(layout: { WatchVerticalLayout { layout } })
    }

    @ViewBuilder
    private var layout: some View {
        Text("Category 1").font(.headline)
        tags(with: "One", category: .category1)

        Text("Category 2").font(.headline)
        tags(with: "Two", category: .category2)

        Text("Category 3").font(.headline)
        tags(with: "Three", category: .category3)

        Text("Category 4").font(.headline)
        tags(with: "Four", category: .category4)

        Text("Category 5").font(.headline)
        tags(with: "Five", category: .category5)
    }

    // swiftlint:disable accessibility_label_for_image
    @ViewBuilder
    private func tags(with label: String, category: MISOCategoricalTag.Category) -> some View {
        Text("None").font(.subheadline)
        MISOCategoricalTag(label: label, category: category, leading: .none, shape: .rounded, size: .default)
        MISOCategoricalTag(label: label, category: category, leading: .none, shape: .rounded, size: .small)
        MISOCategoricalTag(label: label, category: category, leading: .none, shape: .square, size: .default)
        MISOCategoricalTag(label: label, category: category, leading: .none, shape: .square, size: .small)

        Text("Bullet").font(.subheadline)
        MISOCategoricalTag(label: label, category: category, leading: .bullet, shape: .rounded, size: .default)
        MISOCategoricalTag(label: label, category: category, leading: .bullet, shape: .rounded, size: .small)
        MISOCategoricalTag(label: label, category: category, leading: .bullet, shape: .square, size: .default)
        MISOCategoricalTag(label: label, category: category, leading: .bullet, shape: .square, size: .small)

        Text("Image").font(.subheadline)
        MISOCategoricalTag(label: label, category: category, leading: .icon(MISOImage(asset: Image(systemName: "sun.min.fill"))), shape: .rounded, size: .default)
        MISOCategoricalTag(label: label, category: category, leading: .icon(MISOImage(asset: Image(systemName: "sun.min.fill"))), shape: .rounded, size: .small)
        MISOCategoricalTag(label: label, category: category, leading: .icon(MISOImage(asset: Image(systemName: "sun.min.fill"))), shape: .square, size: .default)
        MISOCategoricalTag(label: label, category: category, leading: .icon(MISOImage(asset: Image(systemName: "sun.min.fill"))), shape: .square, size: .small)
    }
    // swiftlint:enable accessibility_label_for_image
}
