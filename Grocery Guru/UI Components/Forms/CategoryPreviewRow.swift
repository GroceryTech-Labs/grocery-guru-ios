import SwiftUI
import DesignSystem
import Categories

struct CategoryPreviewRow: View {
    let category: UICategoryItem

    var body: some View {
        SectionHeader("Preview", font: .headline) {
            CategoryCard(category: category)
        }
    }
}

#Preview {
    CategoryPreviewRow(category: UICategoryItem(categoryName: "Egg", emoji: "🥚"))
}
