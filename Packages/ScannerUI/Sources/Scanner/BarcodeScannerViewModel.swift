import SwiftUI
import CodeScanner
import Routing
import OpenFoodFacts

@MainActor
@Observable
class BarcodeScannerViewModel {
    private var navigator = NavigationService.shared

    var error: Error?

    var isPresentingIndicator = true
    var isLoading = false

    func checkBarcode(for response: Result<ScanResult, ScanError>) async {
        isLoading = true
        switch response {
        case .success(let success):
            withAnimation {
                navigator.push(.invoiceForm(code: success.string))

                error = nil
                isLoading = false
            }

        case .failure(let failure):
            withAnimation {
                error = failure
                isLoading = false
            }
        }
    }
}
