import SwiftUI
import SwiftData
import DesignSystem

@MainActor
@Observable
public class CategoryPickerViewModel {
    private let repository: CategoryRepository

    var categories: [UICategoryItem] = []

    public init(repository: CategoryRepository) {
        self.repository = repository
    }

    func fetchCategories() async {
        do {
            categories = try await repository.fetchCategories()
        } catch {
            print(error)
        }
    }
}

public struct CategoryPicker: View {
    @Binding var selectedElement: UICategoryItem
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
        .onAppear {
            Task {
                await viewModel.fetchCategories()
            }
        }
    }

    public init(viewModel: CategoryPickerViewModel, selectedElement: Binding<UICategoryItem>) {
        self._selectedElement = selectedElement
        self.viewModel = viewModel
    }
}
