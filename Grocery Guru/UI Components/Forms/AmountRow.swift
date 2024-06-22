import SwiftUI

struct AmountRow: View {
    @Binding var viewModel: InvoiceFormViewModel
    @FocusState var focusedField: InvoiceForm.Field?

    var body: some View {
        SectionHeader("Amount", font: .headline) {
            HStack {
                TextField(
                    "Amount",
                    text: $viewModel.amount
                )
                .keyboardType(.numberPad)
                .focused($focusedField, equals: .amount)
                .submitLabel(.next)
                .onSubmit {
                    focusedField = nil
                }
                .accessibilityIdentifier(AccessibilityIdentifier.TextField.invoiceFormAmount)

                MeasureUnitPicker($viewModel.measureUnit)
            }
        }
    }
}

#Preview {
    AmountRow(viewModel: .constant(InvoiceFormViewModel(product: .example)))
}
