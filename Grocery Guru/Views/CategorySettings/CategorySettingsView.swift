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
                    .buttonStyle(.secondary)

                    NavigationLink {
//                        CategoryCreationView(viewModel: CategoryCreationViewModel(repository: .shared))
                    } label: {
                        Text("Manage categories")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.secondary)
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
