import SwiftUI
import DesignSystem

struct AddInvoicePicker: View {
    @Binding var selection: AddInvoiceOption

    var body: some View {
        Picker(String(localized: "Add Invoice Option", bundle: .module), selection: $selection) {
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
