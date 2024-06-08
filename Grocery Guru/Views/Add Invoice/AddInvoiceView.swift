import SwiftUI
import SwiftData

struct AddInvoiceView: View {
    @Environment(\.navigationService)
    private var navigator

    @State private var selectedOption: AddInvoiceOption

    var body: some View {
        VStack(spacing: Constants.Padding.sizeL) {
            AddInvoiceOption.Picker(selection: $selectedOption)

            switch selectedOption {
            case .barCode:
                BarCodeScannerView { result in
                    switch result {
                    case .success(let success):
                        print(success.string)
                        navigator.sheet = nil
                        navigator.push(
                            .invoiceForm(
                                item: InvoiceItem(
                                    name: success.string,
                                    amount: 1,
                                    category: .bakery,
                                    measureUnit: .gram
                                )
                            )
                        )

                    case .failure(let failure):
                        print(failure.localizedDescription)
                    }
                }

            case .manual:
                InvoiceForm()

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
