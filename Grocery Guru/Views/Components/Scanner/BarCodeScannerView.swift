import SwiftUI
import CodeScanner

struct BarCodeScannerView: View {
    @State private var isPresentingIndicator = true
    @State private var scannedCode: String?

    @Binding var isPresentingSuccess: Bool

    let completion: (Result<ScanResult, ScanError>) -> Void

    var body: some View {
        CodeScannerView(
            codeTypes: [.ean8, .ean13],
            scanMode: .once,
            isPaused: isPresentingSuccess
        ) { response in
            withAnimation {
                isPresentingSuccess = true
            }
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
        isPresentingSuccess: Binding<Bool> = .constant(false),
        scannedCode: String? = nil,
        completion: @escaping (Result<ScanResult, ScanError>) -> Void
    ) {
        self._isPresentingSuccess = isPresentingSuccess
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
