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

    @State private var selectedOption: AddInvoiceOption
    @State private var isPresentingIndicator = true

    public var body: some View {
        VStack(spacing: Constants.Padding.sizeL) {
            AddInvoicePicker(selection: $selectedOption)

            switch selectedOption {
            case .barcode:
                BarcodeScannerView(productAPI: productAPI)

            case .manual:
                InvoiceForm(categoryRepository: categoryRepository)

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

    public init(productAPI: ProductAPI, categoryRepository: CategoryRepository, selectedOption: AddInvoiceOption) {
        self.productAPI = productAPI
        self.categoryRepository = categoryRepository
        self.selectedOption = selectedOption
    }
}
