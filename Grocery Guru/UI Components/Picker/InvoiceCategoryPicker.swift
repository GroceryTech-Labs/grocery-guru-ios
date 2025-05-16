import SwiftUI
import SwiftData
import DesignSystem

struct InvoiceCategoryPicker: View {
    @Binding var selection: InvoiceItemCategory

    @Query var customCategories: [CustomCategory]

    private var categories: [InvoiceItemCategory] {
        InvoiceItemCategory.allCases + customCategories.map { category in
            InvoiceItemCategory.custom(
                name: category.name,
                emoji: category.emoji
            )
        }
    }

    var body: some View {
        AnimatableLabelPicker(
            selectedElement: $selection,
            elements: categories
        ) { category in
            pickerLabel(category: category)
        }
    }

    func pickerLabel(category: InvoiceItemCategory) -> some View {
        HStack(spacing: Constants.Padding.sizeS) {
            Text(category.emoji)

            if selection == category {
                Text(category.localized)
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

#Preview {
    @Previewable @State var selection = InvoiceItemCategory.bakery
    InvoiceCategoryPicker(selection: $selection)
}
