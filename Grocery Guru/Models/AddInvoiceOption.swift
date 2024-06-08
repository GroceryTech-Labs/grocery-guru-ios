import SwiftUI

enum AddInvoiceOption: LocalizedStringKey, CaseIterable, Hashable {
    case barCode = "Barcode"
    case manual = "Manual"
    case scan = "Scan"

    struct Picker: View {
        @Binding var selection: AddInvoiceOption

        var body: some View {
            VStack {
                SwiftUI.Picker("Add Invoice Option", selection: $selection) {
                    ForEach(AddInvoiceOption.allCases, id: \.hashValue) { option in
                        Text(option.rawValue)
                            .tag(option)
                    }
                }
                .pickerStyle(.segmented)
                .preferredColorScheme(.light)
                .padding(.horizontal, Constants.Padding.sizeL)
            }
        }
    }

    static var allCases: [Self] {
        [.scan, .barCode, .manual]
    }
}
