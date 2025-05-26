import SwiftUI
import Routing
import Scanner
import DesignSystem
import OpenFoodFacts
import Categories

public struct AddInvoiceView: View {
    @Environment(\.navigationService)
    private var navigator

    private let productAPI: ProductAPI
    private let categoryRepository: CategoryRepository
    private let invoiceRepository: InvoiceRepository

    @State private var selectedOption: AddInvoiceOption

    public var body: some View {
        VStack(spacing: Constants.Padding.sizeL) {
            AddInvoicePicker(selection: $selectedOption)

            switch selectedOption {
            case .barcode:
                BarcodeScannerView(productAPI: productAPI)
                    .transition(
                        .asymmetric(
                            insertion: .push(from: .leading),
                            removal: .move(edge: .leading)
                        )
                    )

            case .manual:
                InvoiceForm(
                    categoryRepository: categoryRepository,
                    invoiceRepository: invoiceRepository
                )
                .transition(
                    .asymmetric(
                        insertion: .push(from: .trailing),
                        removal: .move(edge: .trailing)
                    )
                )

            case .document:
                DocumentScannerView { _ in }
            }
        }
        .animation(.default, value: selectedOption)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
    }

    public init(
        productAPI: ProductAPI,
        categoryRepository: CategoryRepository,
        invoiceRepository: InvoiceRepository,
        selectedOption: AddInvoiceOption
    ) {
        self.productAPI = productAPI
        self.categoryRepository = categoryRepository
        self.invoiceRepository = invoiceRepository
        self.selectedOption = selectedOption
    }
}
