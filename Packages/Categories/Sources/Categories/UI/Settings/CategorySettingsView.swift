import SwiftUI
import DesignSystem
import Routing

@Observable
public class CategorySettingsViewModel {
    let repository: CategoryRepository

    var categories: [UICategoryItem] = []
    var isCategoryCreationShown = false

    @MainActor
    init(repository: CategoryRepository) {
        self.repository = repository
    }

    @MainActor
    func fetchCategories() async {
        do {
            categories = try await repository.fetchCategories()
        } catch {
            print(error.localizedDescription)
        }
    }
}

public struct CategorySettingsView: View {
    @Environment(\.navigationService) var navigator

    @State private var viewModel: CategorySettingsViewModel

    public var body: some View {
        ScrollView {
            SectionHeader("Category Settings".localized) {
                    ForEach(viewModel.categories) { category in
                        Text(category.emoji + " " + category.categoryName)
                    }
                // CategoryList
                // Edit display order
                // Delete category
                // Update category (also update items category)
            } trailing: {
                EditButton()
            }
            .padding(Constants.Padding.sizeL)
        }
        .task {
            await viewModel.fetchCategories()
        }
        .scrollIndicators(.hidden)
        .scrollBounceBehavior(.basedOnSize)
        .sheet(isPresented: $viewModel.isCategoryCreationShown) {
            CategoryCreationView(
                viewModel: CategoryCreationViewModel(
                    repository: viewModel.repository
                )
            )
        }
    }

    public init(repository: CategoryRepository) {
        self._viewModel = State(
            initialValue: CategorySettingsViewModel(
                repository: repository
            )
        )
    }
}

#Preview {
    CategorySettingsView(
        repository: MockCategoryRepositoryImpl()
    )
}

public extension TextFieldStyle where Self == ToggleTextFieldStyle {
    static func toggleTextField(text: Binding<String>, editMode: EditMode?) -> Self {
        ToggleTextFieldStyle(text: text, editMode: editMode)
    }
}
