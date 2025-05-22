import SwiftUI
import SwiftData
import DesignSystem

@Observable
public class CategoryPickerViewModel {
    private let repository: CategoryRepository
    var categories: [BaseCategory] = []

    public init(repository: CategoryRepository) {
        self.repository = repository
    }

    func fetchCategories() async {
        do {
            let data = try await repository.fetchCategories()
            let baseCategories = data.map {
                BaseCategory
                    .custom(
                        name: $0.categoryName,
                        emoji: $0.emoji
                    )
            }
            categories = baseCategories
        } catch {
            print(error)
        }
    }
}

public struct CategoryPicker: View {
    @Binding var selectedElement: BaseCategory
    @State private var viewModel: CategoryPickerViewModel

    public var body: some View {
        AnimatableLabelPicker(
            selectedElement: $selectedElement,
            elements: viewModel.categories
        ) { category in
            CategoryPickerLabel(
                selectedCategory: selectedElement,
                category: category
            )
        }
    }

    public init(viewModel: CategoryPickerViewModel, selectedElement: Binding<BaseCategory>) {
        self._selectedElement = selectedElement
        self.viewModel = viewModel
    }
}
