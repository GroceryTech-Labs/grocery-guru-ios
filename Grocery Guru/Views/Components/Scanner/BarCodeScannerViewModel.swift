import SwiftUI
import CodeScanner

@Observable
final class BarCodeScannerViewModel {
    var navigator = NavigationService.shared

    var error: Error?

    var isPresentingIndicator = true
    var isLoading = false
    var scannedCode: String?

    func checkBarcode(for response: Result<ScanResult, ScanError>) async {
        isLoading = true
        switch response {
        case .success(let success):
            do {
                let result = try await OFFRepository.shared.getProductResult(barcode: success.string)

                navigator.push(.invoiceForm(product: result.product))

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
