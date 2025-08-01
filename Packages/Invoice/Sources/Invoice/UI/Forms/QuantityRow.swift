import SwiftUI
import DesignSystem

struct QuantityRow: View {
    @FocusState var focusedField: InvoiceForm.Field?
    @Binding var quantity: String
    @Binding var unit: String

    var body: some View {
        SectionHeader("Quantity".localized, font: .headline) {
            HStack {
                TextField(
                    "Quantity".localized,
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
                    "Unit".localized,
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
