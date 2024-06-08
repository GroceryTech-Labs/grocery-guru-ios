import SwiftUI
import CodeScanner

struct BarCodeScannerView: View {
    @State private var isPresentingIndicator = true
    @State private var scannedCode: String?

    let completion: (Result<ScanResult, ScanError>) -> Void

    var body: some View {
        CodeScannerView(
            codeTypes: [.ean8, .ean13],
            scanMode: .once
        ) { response in
            completion(response)
        }
        .overlay(alignment: .center) {
            ScannerOverlay(
                isPresented: $isPresentingIndicator,
                systemImage: "barcode.viewfinder"
            )
        }
    }
}

#Preview {
    BarCodeScannerView { result in
        switch result {
        case .success(let success):
            print(success.string)

        case .failure(let failure):
            print(failure.localizedDescription)
        }
    }
}
