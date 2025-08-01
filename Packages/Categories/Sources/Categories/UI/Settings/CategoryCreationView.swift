import SwiftUI
import DesignSystem

public struct CategoryCreationView: View {
    enum Field: Hashable {
        case name
        case emoji
    }

    @FocusState private var focusedField: Field?
    @State private var viewModel: CategoryCreationViewModel

    public var body: some View {
        ScrollView {
            SectionHeader("Create Category".localized) {
                VStack(spacing: Constants.Padding.sizeXL) {
                    SectionHeader("Name".localized, font: .headline) {
                        TextField(
                            "Name".localized,
                            text: $viewModel.name,
                            prompt: Text("Pringles".localized)
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

                    SectionHeader("Emoji".localized, font: .headline) {
                        EmojiTextFieldWrapper(text: $viewModel.emoji)
                    }
                    .focused($focusedField, equals: .emoji)
                    .submitLabel(.done)
                    .onSubmit {
                        focusedField = nil
                    }

                    CategoryPreviewRow(
                        category: UICategoryItem(
                            categoryName: viewModel.name,
                            emoji: viewModel.emoji
                        )
                    )

                    Button {
                        Task {
                            await viewModel.addCategory()
                        }
                    } label: {
                        Text("Create".localized)
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
                        .accessibilityLabel("Reset".localized)
                }
            }
            .padding(Constants.Padding.sizeL)
        }
        .scrollIndicators(.hidden)
        .onDisappear {
            viewModel.resetToInitialState()
        }
    }

    public init(viewModel: CategoryCreationViewModel) {
        self.viewModel = viewModel
    }
}
