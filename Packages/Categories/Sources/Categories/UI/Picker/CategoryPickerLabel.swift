import SwiftUI
import DesignSystem

struct CategoryPickerLabel: View {
    let selectedCategory: UICategoryItem
    let category: UICategoryItem

    var body: some View {
        HStack(spacing: Constants.Padding.sizeS) {
            Text(category.emoji)

            if selectedCategory == category {
                Text(category.categoryName)
                    .foregroundStyle(.white)
                    .lineLimit(1)
                    .transition(
                        .asymmetric(
                            insertion: .push(from: .trailing),
                            removal: .move(edge: .trailing)
                        )
                    )
            }
        }
        .clipped()
        .accessibilityIdentifier(
            AccessibilityIdentifier.Button.invoiceCategory
        )
    }
}
