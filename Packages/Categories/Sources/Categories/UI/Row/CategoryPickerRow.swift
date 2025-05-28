import SwiftUI
import DesignSystem

public struct CategoryPickerRow: View {
    @Binding var selectedCategory: UICategoryItem?
    private let categoryRepository: CategoryRepository

    public var body: some View {
        SectionHeader(String(localized: "Category", bundle: .module), font: .headline) {
            CategoryPicker(
                viewModel: CategoryPickerViewModel(repository: categoryRepository),
                selectedElement: $selectedCategory
            )
        } trailing: {
            Button(String(localized: "Show all", bundle: .module)) { }
        }
    }

    public init(selectedCategory: Binding<UICategoryItem?>, categoryRepository: CategoryRepository) {
        self._selectedCategory = selectedCategory
        self.categoryRepository = categoryRepository
    }
}
