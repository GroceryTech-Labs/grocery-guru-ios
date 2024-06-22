import SwiftUI

struct CategoryRow: View {
    @Binding var category: InvoiceItemCategory

    var body: some View {
        SectionHeader("Category", font: .headline) {
            InvoiceCategoryPicker(selection: $category)
                .padding(.horizontal, -Constants.Padding.sizeL)
        } trailing: {
            Button("Show all") { }
        }
    }
}

#Preview {
    CategoryRow(category: .constant(.bakery))
}
