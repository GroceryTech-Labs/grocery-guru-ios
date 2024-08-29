import SwiftUI

struct CategoryCreationView: View {
    enum Field: Hashable {
        case name
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

                    EmojiRow { emoji in
                        viewModel.emoji = emoji
                    }

                    CategoryPreviewRow(
                        invoiceItemCategory: .custom(
                            name: viewModel.name,
                            emoji: viewModel.emoji
                        )
                    )

                    Button {
                        viewModel.addCategory()
                    } label: {
                        Text("Create")
                            .frame(maxWidth: .infinity)
                    }
                    .disabled(viewModel.emoji.isEmpty || viewModel.name.isEmpty)
                    .buttonStyle(.borderedProminent)
                }
            } trailing: {
                Button {
                    viewModel.resetToInitialState()
                } label: {
                    Image(systemName: "eraser")
                        .accessibilityLabel("Reset")
                }
            }
            .padding(Constants.Padding.sizeL)
        }
        .scrollIndicators(.hidden)
        .onDisappear {
            viewModel.resetToInitialState()
        }
    }

    @MainActor
    init() {
        self.viewModel = CategoryCreationViewModel(repository: .shared)
    }
}

#Preview {
    CategoryCreationView()
}
