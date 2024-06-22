import SwiftUI

struct NutrimentsRow: View {
    @Binding var product: OFFProduct?
    @Binding var isExpanded: Bool

    var body: some View {
        if let nutriments = product?.nutriments {
            DisclosureGroup(isExpanded: $isExpanded) {
                OFFNutrimentsView(nutriments: nutriments)
            } label: {
                Text("Nutriments (100g)")
                    .font(.headline)
                    .accessibilityIdentifier(AccessibilityIdentifier.Button.invoiceFormNutriments)
            }
        }
    }
}

#Preview {
    NutrimentsRow(
        product: .constant(.example),
        isExpanded: .constant(true)
    )
}
