import SwiftUI

struct FormsAddInvoiceButton: View {
    @Binding var viewModel: InvoiceFormViewModel
    @FocusState var focusedField: InvoiceForm.Field?

    var body: some View {
        Button {
            guard !viewModel.name.isEmpty else {
                focusedField = .name
                return
            }

            guard !viewModel.amount.isEmpty else {
                focusedField = .amount
                return
            }

            viewModel.addInvoice()
        } label: {
            Text("Add to inventory")
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .accessibilityIdentifier(AccessibilityIdentifier.Button.invoiceFormSubmit)
    }
}
