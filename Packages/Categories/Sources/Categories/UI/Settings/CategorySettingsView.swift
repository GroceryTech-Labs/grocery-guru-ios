import SwiftUI
import DesignSystem

public struct CategorySettingsView: View {
    public var body: some View {
        NavigationView {
            ScrollView {
                SectionHeader("Category Settings") {
                    NavigationLink {
                        CategoryCreationView()
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

    public init() { }
}

#Preview {
    CategorySettingsView()
}
