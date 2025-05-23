import SwiftUI
import CodeScanner
import OpenFoodFacts
import Routing

@Observable
final class BarcodeScannerViewModel {
    private let productAPI: ProductAPI
    @MainActor private var navigator = NavigationService.shared

    var error: Error?

    var isPresentingIndicator = true
    var isLoading = false
    var scannedCode: String?

    init(productAPI: ProductAPI) {
        self.productAPI = productAPI
    }

    @MainActor
    func checkBarcode(for response: Result<ScanResult, ScanError>) async {
        isLoading = true
        switch response {
        case .success(let success):
            do {
                let product = try await productAPI.fetchProduct(barcode: success.string)
                navigator.push(
                    .invoiceForm(
                        RouteInvoiceFormItem(
                            code: scannedCode,
                            name: product.productName
                        )
                    )
                )

                withAnimation {
                    error = nil
                    isLoading = false
                }
            } catch {
                withAnimation {
                    self.error = error
                    isLoading = false
                }
            }

        case .failure(let failure):
            withAnimation {
                error = failure
                isLoading = false
            }
        }
    }
}
