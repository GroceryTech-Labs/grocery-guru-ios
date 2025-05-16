import SwiftUI
import DesignSystem

public struct NutrimentsRow: View {
    @Binding public var isExpanded: Bool
    let nutriments: UINutrimentsItem?

    public var body: some View {
        if let nutriments {
            DisclosureGroup(isExpanded: $isExpanded) {
                NutrimentsView(nutriments: nutriments)
            } label: {
                Text("Nutriments (100g)")
                    .font(.headline)
                    .accessibilityIdentifier(AccessibilityIdentifier.Button.invoiceFormNutriments)
            }
        }
    }

    public init(isExpanded: Binding<Bool>, nutriments: UINutrimentsItem?) {
        self._isExpanded = isExpanded
        self.nutriments = nutriments
    }
}
