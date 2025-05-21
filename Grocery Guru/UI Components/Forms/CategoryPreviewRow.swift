import SwiftUI
import DesignSystem
import Categories

struct CategoryPreviewRow: View {
    let category: BaseCategory

    var body: some View {
        SectionHeader("Preview", font: .headline) {
            CategoryCard(category: category)
        }
    }
}

#Preview {
    CategoryPreviewRow(category: .bakery)
}
