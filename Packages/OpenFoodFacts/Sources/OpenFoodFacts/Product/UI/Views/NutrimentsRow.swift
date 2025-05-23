import SwiftUI
import DesignSystem

public struct NutrimentsRow: View {
    @Binding public var isExpanded: Bool
    let code: String

    public var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            NutrimentsView(code: code)
        } label: {
            Text("Nutriments (100g)")
                .font(.headline)
                .accessibilityIdentifier(AccessibilityIdentifier.Button.invoiceFormNutriments)
        }
    }

    public init(isExpanded: Binding<Bool>, code: String) {
        self._isExpanded = isExpanded
        self.code = code
    }
}
