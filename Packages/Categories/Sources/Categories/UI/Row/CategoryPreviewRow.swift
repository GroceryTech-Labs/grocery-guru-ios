import SwiftUI
import DesignSystem

struct CategoryPreviewRow: View {
    let category: UICategoryItem

    var body: some View {
        SectionHeader(
            String(
                localized: "Preview",
                bundle: .module
            ),
            font: .headline
        ) {
            CategoryCard(category: .constant(category))
        }
    }
}

#Preview {
    CategoryPreviewRow(
        category: UICategoryItem(
            id: UUID(),
            categoryName: "Egg",
            emoji: "🥚"
        )
    )
}
