import SwiftUI
import DesignSystem

public struct CategorySettingsView: View {
    let repository: CategoryRepository

    public var body: some View {
        NavigationView {
            ScrollView {
                SectionHeader("Category Settings") {
                    NavigationLink {
                        CategoryCreationView(viewModel: CategoryCreationViewModel(repository: repository))
                    } label: {
                        Text("Create")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.secondary)

                    NavigationLink {
                        // CustomCategoryList
                        // Edit display order
                        // Delete category
                        // Update category (also update items category)
                        // CategoryCreationView(viewModel: CategoryCreationViewModel(repository: .shared))
                    } label: {
                        Text("Manage")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.secondary)
                }
                .padding(Constants.Padding.sizeL)
            }
            .scrollIndicators(.hidden)
        }
    }

    public init(repository: CategoryRepository) {
        self.repository = repository
    }
}
