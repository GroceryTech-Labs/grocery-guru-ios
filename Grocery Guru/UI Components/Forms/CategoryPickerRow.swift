import SwiftUI
import DesignSystem
import Categories
import LocalStorage

struct CategoryPickerRow: View {
    @Binding var selectedCategory: UICategoryItem

    var body: some View {
        SectionHeader("Category", font: .headline) {
            CategoryPicker(
                viewModel: CategoryPickerViewModel(repository: CategoryRepositoryImpl()),
                selectedElement: $selectedCategory
            )
                .padding(.horizontal, -Constants.Padding.sizeL)
        } trailing: {
            Button("Show all") { }
        }
    }
}

#Preview {
    CategoryPickerRow(selectedCategory: .constant(UICategoryItem(categoryName: "Egg", emoji: "🥚")))
}
