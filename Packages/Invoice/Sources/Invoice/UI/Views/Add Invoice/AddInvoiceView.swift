import SwiftUI
import Routing
import Scanner
import DesignSystem

public struct AddInvoiceView: View {
    @Environment(\.navigationService)
    private var navigator

    @State private var selectedOption: AddInvoiceOption
    @State private var isPresentingIndicator = true

    public var body: some View {
        VStack(spacing: Constants.Padding.sizeL) {
            AddInvoicePicker(selection: $selectedOption)

            switch selectedOption {
            case .barcode:
                BarcodeScannerView()

            case .manual:
                InvoiceForm()

            case .document:
                DocumentScannerView { _ in }
                    .onAppear {
                        isPresentingIndicator = true
                    }
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
    }

    public init(selectedOption: AddInvoiceOption) {
        self.selectedOption = selectedOption
    }
}

#Preview {
    AddInvoiceView(selectedOption: .manual)
}
