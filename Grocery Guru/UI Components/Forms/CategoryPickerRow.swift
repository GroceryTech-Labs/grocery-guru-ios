import SwiftUI
import DesignSystem
import Categories

struct CategoryPickerRow: View {
    @Binding var selectedCategory: Categories.BaseCategory

    var body: some View {
        SectionHeader("Category", font: .headline) {
            CategoryPicker(selectedElement: $selectedCategory)
                .padding(.horizontal, -Constants.Padding.sizeL)
        } trailing: {
            Button("Show all") { }
        }
    }
}

#Preview {
    CategoryPickerRow(selectedCategory: .constant(.bakery))
}
