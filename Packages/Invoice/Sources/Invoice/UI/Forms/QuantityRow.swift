import SwiftUI
import DesignSystem

struct QuantityRow: View {
    @FocusState var focusedField: InvoiceForm.Field?
    @Binding var quantity: String
    @Binding var unit: String

    var body: some View {
        SectionHeader(String(localized: "Quantity", bundle: .module), font: .headline) {
            HStack {
                TextField(
                    String(localized: "Quantity", bundle: .module),
                    text: $quantity
                )
                .focused($focusedField, equals: .quantity)
                .submitLabel(.next)
                .onSubmit {
                    focusedField = .unit
                }
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .accessibilityIdentifier(AccessibilityIdentifier.TextField.invoiceFormQuantity)

                TextField(
                    String(localized: "Unit", bundle: .module),
                    text: $unit
                )
                .focused($focusedField, equals: .unit)
                .submitLabel(.done)
                .onSubmit {
                    focusedField = nil
                }
                .textFieldStyle(.roundedBorder)
                .accessibilityIdentifier(AccessibilityIdentifier.TextField.invoiceFormUnit)
                .frame(width: 60)
            }
        }
    }
}

#Preview {
    QuantityRow(
        quantity: .constant("500"),
        unit: .constant("g")
    )
}
