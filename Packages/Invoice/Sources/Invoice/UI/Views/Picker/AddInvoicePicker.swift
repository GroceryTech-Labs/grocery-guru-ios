import SwiftUI
import DesignSystem

struct AddInvoicePicker: View {
    @Binding var selection: AddInvoiceOption

    var body: some View {
        Picker("Add Invoice Option", selection: $selection) {
            ForEach(AddInvoiceOption.allCases, id: \.hashValue) { option in
                Text(option.rawValue)
                    .tag(option)
                    .accessibilityIdentifier(option.accessibilityIdentifier)
            }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal, Constants.Padding.sizeL)
    }
}

#Preview {
    AddInvoicePicker(selection: .constant(.manual))
}
