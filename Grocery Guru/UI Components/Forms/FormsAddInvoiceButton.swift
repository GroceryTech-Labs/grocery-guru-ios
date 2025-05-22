import SwiftUI
import DesignSystem

struct FormsAddInvoiceButton: View {
    let viewModel: InvoiceFormViewModel
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

            //            Task {
            //                await viewModel.addInvoice()
            //            }
        } label: {
            Text("Add to inventory")
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.primary)
        .accessibilityIdentifier(AccessibilityIdentifier.Button.invoiceFormSubmit)
    }
}
