import SwiftUI
import OpenFoodFacts

struct NutrimentsRow: View {
    @Binding var product: APIProductItem?
    @Binding var isExpanded: Bool

    var body: some View {
        if let nutriments = product?.nutriments {
            DisclosureGroup(isExpanded: $isExpanded) {
                NutrimentsView(nutriments: nutriments)
            } label: {
                Text("Nutriments (100g)")
                    .font(.headline)
                    .accessibilityIdentifier(AccessibilityIdentifier.Button.invoiceFormNutriments)
            }
        }
    }
}
