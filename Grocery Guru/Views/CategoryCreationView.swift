import SwiftUI

struct CategoryCreationView: View {
    enum Field: Hashable {
        case name
        case emoji
    }

    @FocusState private var focusedField: Field?
    @State private var viewModel: CategoryCreationViewModel

    var body: some View {
        ScrollView {
            SectionHeader("Create Category") {
                VStack(spacing: Constants.Padding.sizeXL) {
                    NameRow(name: $viewModel.name)
                        .focused($focusedField, equals: .name)
                        .submitLabel(.done)
                        .onSubmit {
                            focusedField = nil
                        }

                    Button("Create") {
                        guard !viewModel.name.isEmpty else {
                            focusedField = .name
                            return
                        }

                        viewModel.addCategory()
                    }
                }
            }
            .padding(Constants.Padding.sizeL)
        }
        .scrollIndicators(.hidden)
    }

    @MainActor
    init() {
        self.viewModel = CategoryCreationViewModel(categoryRepository: .shared)
    }
}

#Preview {
    CategoryCreationView()
}
