import SwiftUI

struct NameRow: View {
    @Binding var viewModel: InvoiceFormViewModel
    @FocusState var focusedField: InvoiceForm.Field?

    var body: some View {
        SectionHeader("Name", font: .headline) {
            TextField(
                "Name",
                text: $viewModel.name,
                prompt: Text("Pringles")
            )
            .focused($focusedField, equals: .name)
            .submitLabel(.next)
            .onSubmit {
                focusedField = .amount
            }
            .accessibilityIdentifier(
                AccessibilityIdentifier.TextField.invoiceFormName
            )
        }
    }
}

#Preview {
    NameRow(viewModel: .constant(InvoiceFormViewModel(product: .example)))
}
