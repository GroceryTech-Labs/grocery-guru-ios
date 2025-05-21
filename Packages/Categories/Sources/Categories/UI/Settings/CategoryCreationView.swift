import SwiftUI
import DesignSystem
import LocalStorage

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
                    SectionHeader("Name", font: .headline) {
                        TextField(
                            "Name",
                            text: $viewModel.name,
                            prompt: Text("Pringles")
                        )
                        .textFieldStyle(.roundedBorder)
                        .accessibilityIdentifier(
                            AccessibilityIdentifier.TextField.invoiceFormName
                        )
                    }
                    .focused($focusedField, equals: .name)
                    .submitLabel(.next)
                    .onSubmit {
                        focusedField = .emoji
                    }

                    SectionHeader("Emoji", font: .headline) {
                        EmojiTextFieldWrapper(text: $viewModel.emoji)
                    }
                    .focused($focusedField, equals: .emoji)
                    .submitLabel(.done)
                    .onSubmit {
                        focusedField = nil
                    }

                    SectionHeader("Preview", font: .headline) {
                        CategoryCard(category: .custom(
                            name: viewModel.name,
                            emoji: viewModel.emoji
                        ))
                    }

                    Button {
                        Task {
                            await viewModel.addCategory()
                        }
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

    init() {
        self.viewModel = CategoryCreationViewModel()
    }
}

#Preview {
    CategoryCreationView()
}
