import SwiftUI

struct CategoryRow: View {
    @Binding var viewModel: InvoiceFormViewModel

    var body: some View {
        SectionHeader("Category", font: .headline) {
            InvoiceCategoryPicker(selection: $viewModel.category)
                .padding(.horizontal, -Constants.Padding.sizeL)
        } trailing: {
            Button("Show all") { }
        }
        .padding(.horizontal, Constants.Padding.sizeL)
    }
}

#Preview {
    CategoryRow(
        viewModel: .constant(InvoiceFormViewModel(product: .example))
    )
}
