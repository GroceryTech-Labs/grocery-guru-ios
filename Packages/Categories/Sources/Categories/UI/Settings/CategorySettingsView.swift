import SwiftUI
import DesignSystem

public struct CategorySettingsView: View {
    let repository: CategoryRepository

    public var body: some View {
        NavigationView {
            ScrollView {
                SectionHeader(String(localized: "Category Settings", bundle: .module)) {
                    NavigationLink {
                        CategoryCreationView(viewModel: CategoryCreationViewModel(repository: repository))
                    } label: {
                        Text("Create", bundle: .module)
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
                        Text("Manage", bundle: .module)
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
