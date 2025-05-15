import SwiftUI
import SwiftData
import DesignSystem

struct AddInvoiceView: View {
    @Environment(\.navigationService)
    private var navigator

    @State private var selectedOption: AddInvoiceOption
    @State private var isPresentingIndicator = true

    var body: some View {
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
                    .overlay(alignment: .center) {
                        ScannerOverlay(
                            isPresented: $isPresentingIndicator,
                            systemImage: "doc.viewfinder"
                        )
                    }
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
    }

    init(selectedOption: AddInvoiceOption) {
        self.selectedOption = selectedOption
    }
}

#Preview {
    AddInvoiceView(selectedOption: .manual)
}
