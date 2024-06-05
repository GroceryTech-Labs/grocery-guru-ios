import SwiftUI
import SwiftData

struct AddInvoiceView: View {
    @State private var selectedOption: AddInvoiceOption

    var body: some View {
        VStack(spacing: Constants.Padding.sizeL) {
            AddInvoiceOption.Picker(selection: $selectedOption)

            switch selectedOption {
            case .manual:
                AddInvoiceForm()

            case .scan:
                ScannerView { _ in }
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
        .padding(.top, Constants.Padding.sizeL)
        .background(Color.surfacePrimary, ignoresSafeAreaEdges: .all)
        .foregroundStyle(.labelPrimary)
    }

    init(selectedOption: AddInvoiceOption) {
        self.selectedOption = selectedOption
    }
}

#Preview {
    AddInvoiceView(selectedOption: .manual)
}
