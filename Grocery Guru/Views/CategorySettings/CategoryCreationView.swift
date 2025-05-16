import SwiftUI
import DesignSystem

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
                        .submitLabel(.next)
                        .onSubmit {
                            focusedField = .emoji
                        }

                    EmojiRow(selection: $viewModel.emoji)
                        .focused($focusedField, equals: .emoji)
                        .submitLabel(.done)
                        .onSubmit {
                            focusedField = nil
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
