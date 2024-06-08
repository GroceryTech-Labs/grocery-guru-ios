import SwiftUI
import SwiftData

struct AddInvoiceView: View {
    @Environment(\.navigationService)
    private var navigator

    @State private var selectedOption: AddInvoiceOption
    @State private var isPresentingIndicator = true
    @State private var isPresentingSuccess = false

    var body: some View {
        VStack(spacing: Constants.Padding.sizeL) {
            AddInvoiceOption.Picker(selection: $selectedOption)

            switch selectedOption {
            case .barCode:
                barCodeView

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
        .overlay(alignment: .center) {
            ScannerOverlay(
                isPresented: $isPresentingSuccess,
                systemImage: "checkmark.diamond.fill",
                color: .success
            )
        }
        .background(Color.surfacePrimary, ignoresSafeAreaEdges: .all)
        .foregroundStyle(.labelPrimary)
    }

    private var barCodeView: some View {
        BarCodeScannerView(isPresentingSuccess: $isPresentingSuccess) { result in
            switch result {
            case .success(let success):
                Task {
                    do {
                        let result = try await OFFRepository.shared.getProductResult(barcode: success.string)
                        navigator.push(.invoiceForm(product: result.product))
                    } catch {
                        print(error.localizedDescription)
                    }
                }

            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }

    init(selectedOption: AddInvoiceOption) {
        self.selectedOption = selectedOption
    }
}

#Preview {
    AddInvoiceView(selectedOption: .manual)
}
