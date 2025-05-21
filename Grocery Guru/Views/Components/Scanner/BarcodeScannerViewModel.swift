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

    func checkBarcode(for response: Result<ScanResult, ScanError>) async {
        isLoading = true
        switch response {
        case .success(let success):
            do {
                let response = try await productAPI.fetchProduct(barcode: success.string)
                let result = UIProductItem(from: response)

                await navigator.push(.invoiceForm)

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
