import SwiftUI

struct CategoryRow: View {
    @Binding var viewModel: InvoiceFormViewModel

    var body: some View {
        SectionHeader("Category", font: .headline) {
            InvoiceCategoryPicker(selection: $viewModel.category)
        } trailing: {
            Button("Show all") { }
        }
    }
}

#Preview {
    CategoryRow(
        viewModel: .constant(InvoiceFormViewModel(product: .example))
    )
}
