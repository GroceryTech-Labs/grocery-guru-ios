import SwiftUI

struct CategorySettingsView: View {
    enum Field: Hashable {
        case name
    }

    @FocusState private var focusedField: Field?
    @State private var viewModel: CategoryCreationViewModel

    var body: some View {
        ScrollView {
            SectionHeader("Category Settings") {
                VStack(spacing: Constants.Padding.sizeXL) {
                    NameRow(name: $viewModel.name)
                        .focused($focusedField, equals: .name)
                        .submitLabel(.done)
                        .onSubmit {
                            focusedField = nil
                        }

                    EmojiRow { emoji in
                        viewModel.emoji = emoji
                    }

                    CategoryPreviewRow(
                        invoiceItemCategory: .custom(
                            name: viewModel.name,
                            emoji: viewModel.emoji
                        )
                    )

                    Button("Create") {
                        guard !viewModel.name.isEmpty else {
                            focusedField = .name
                            return
                        }

                        guard !viewModel.emoji.isEmpty else {
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
        self.viewModel = CategoryCreationViewModel(repository: .shared)
    }
}

#Preview {
    CategorySettingsView()
}
