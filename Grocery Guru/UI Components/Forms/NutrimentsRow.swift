import SwiftUI

struct NutrimentsRow: View {
    @Binding var viewModel: InvoiceFormViewModel

    var body: some View {
        if let product = viewModel.product {
            DisclosureGroup(isExpanded: $viewModel.isPresentingNutriments) {
                OFFNutrimentsView(nutriments: product.nutriments)
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
        viewModel: .constant(
            InvoiceFormViewModel(
                product: .example
            )
        )
    )
}
