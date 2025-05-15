import SwiftUI
import DesignSystem

public struct NutrimentsRow: View {
    @Binding public var product: UIProductItem?
    @Binding public var isExpanded: Bool

    public var body: some View {
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

    public init(product: Binding<UIProductItem?>, isExpanded: Binding<Bool>) {
        self._product = product
        self._isExpanded = isExpanded
    }
}
