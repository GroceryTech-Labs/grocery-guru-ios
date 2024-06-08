import SwiftUI
import CodeScanner

struct BarCodeScannerView: View {
    @State private var isPresentingIndicator = true
    @State private var isPresentingScanner = false
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

    init(
        isPresentingScanner: Bool = false,
        scannedCode: String? = nil,
        completion: @escaping (Result<ScanResult, ScanError>) -> Void
    ) {
        self.isPresentingScanner = isPresentingScanner
        self.scannedCode = scannedCode
        self.completion = completion
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
