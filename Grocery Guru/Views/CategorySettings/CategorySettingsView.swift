import SwiftUI

struct CategorySettingsView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                SectionHeader("Category Settings") {
                    NavigationLink {
                        CategoryCreationView()
                    } label: {
                        Text("Create")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.primary)

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
                    .buttonStyle(.primary)
                }
                .padding(Constants.Padding.sizeL)
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    CategorySettingsView()
}
