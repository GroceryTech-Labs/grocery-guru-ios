import SwiftUI
import CodeScanner
import OpenFoodFacts

@Observable
final class BarcodeScannerViewModel {
    private let productAPI: ProductAPI
    private var navigator = NavigationService.shared

    var error: Error?

    var isPresentingIndicator = true
    var isLoading = false
    var scannedCode: String?

    init(productAPI: ProductAPI) {
        self.productAPI = productAPI
    }

    func checkBarcode(for response: Result<ScanResult, ScanError>) async {
        isLoading = true
        switch response {
        case .success(let success):
            do {
                let result = try await productAPI.fetchProduct(barcode: success.string)

                navigator.push(.invoiceForm(product: result))

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
