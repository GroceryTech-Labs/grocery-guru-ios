import SwiftUI
import DesignSystem
import Routing

public struct CategorySettingsView: View {
    @Environment(\.editMode) var editMode

    let repository: CategoryRepository
    let categoryId: UUID

    @State var text = "Drinks"
    @State var emoji = "🍹"

    public var body: some View {
        NavigationView {
            SectionHeader("Category Settings".localized) {

                // CategoryList
                // Edit display order
                // Delete category
                // Update category (also update items category)
                List {
                    Group {
                        SectionHeader("Name".localized, font: .headline) {
                            ToggleTextField(
                                label: "Category Name".localized,
                                text: $text,
                                prompt: "Drinks"
                            )
                        }

                        SectionHeader("Emoji".localized, font: .headline) {
                            EmojiTextFieldWrapper(text: $emoji)
                                .textFieldStyle(
                                    .toggleTextField(
                                        text: $emoji,
                                        editMode: editMode?.wrappedValue
                                    )
                                )
                        }
                    }
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(.zero))
                }
                .scrollBounceBehavior(.basedOnSize)
                .listStyle(.inset)
                .listRowSpacing(Constants.Padding.sizeM)
                .scrollIndicators(.hidden)
            } trailing: {
                EditButton()
            }
            .padding(Constants.Padding.sizeL)
        }
    }

    public init(repository: CategoryRepository, categoryId: UUID) {
        self.repository = repository
        self.categoryId = categoryId
    }
}

#Preview {
    CategorySettingsView(
        repository: MockCategoryRepositoryImpl(),
        categoryId: UUID()
    )
}

public extension TextFieldStyle where Self == ToggleTextFieldStyle {
    static func toggleTextField(text: Binding<String>, editMode: EditMode?) -> Self {
        ToggleTextFieldStyle(text: text, editMode: editMode)
    }
}
