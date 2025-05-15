import SwiftUI
import DesignSystem

struct CategoryPickerRow: View {
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
    CategoryPickerRow(category: .constant(.bakery))
}
