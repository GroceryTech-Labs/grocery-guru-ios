import SwiftUI
import DesignSystem

public struct CategoryPickerRow: View {
    @Binding var selectedCategory: UICategoryItem
    private let repository: CategoryRepository

    public var body: some View {
        SectionHeader("Category", font: .headline) {
            CategoryPicker(
                viewModel: CategoryPickerViewModel(repository: repository),
                selectedElement: $selectedCategory
            )
        } trailing: {
            Button("Show all") { }
        }
    }

    public init(selectedCategory: Binding<UICategoryItem>, repository: CategoryRepository) {
        self._selectedCategory = selectedCategory
        self.repository = repository
    }
}
