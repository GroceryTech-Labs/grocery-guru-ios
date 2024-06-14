import SwiftUI
import SwiftData

struct AddInvoiceView: View {
    @Environment(\.navigationService)
    private var navigator

    @State private var selectedOption: AddInvoiceOption
    @State private var isPresentingIndicator = true

    var body: some View {
        VStack(spacing: Constants.Padding.sizeL) {
            AddInvoiceOption.Picker(selection: $selectedOption)

            switch selectedOption {
            case .barCode:
                BarCodeScannerView()

            case .manual:
                InvoiceForm()

            case .scan:
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
        .padding(.top, Constants.Padding.sizeL)
    }

    init(selectedOption: AddInvoiceOption) {
        self.selectedOption = selectedOption
    }
}

#Preview {
    AddInvoiceView(selectedOption: .manual)
}
