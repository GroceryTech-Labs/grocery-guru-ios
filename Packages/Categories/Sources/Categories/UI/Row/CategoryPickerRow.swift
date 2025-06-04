import SwiftUI
import DesignSystem

public struct CategoryPickerRow: View {
    @Binding var selectedCategory: UICategoryItem?
    private let categoryRepository: CategoryRepository

    public var body: some View {
        SectionHeader("Category".localized, font: .headline) {
            CategoryPicker(
                viewModel: CategoryPickerViewModel(repository: categoryRepository),
                selectedElement: $selectedCategory
            )
        } trailing: {
            Button("Show all".localized) { }
        }
    }

    public init(selectedCategory: Binding<UICategoryItem?>, categoryRepository: CategoryRepository) {
        self._selectedCategory = selectedCategory
        self.categoryRepository = categoryRepository
    }
}
