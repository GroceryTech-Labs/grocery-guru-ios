import SwiftUI
import CodeScanner

struct BarCodeScannerView: View {
    @State private var viewModel = BarCodeScannerViewModel()

    var body: some View {
        CodeScannerView(
            codeTypes: [.ean13],
            scanMode: .oncePerCode,
            simulatedData: "4066600603405",
            isPaused: viewModel.isLoading,
            videoCaptureDevice: .systemPreferredCamera
        ) { response in
            if !viewModel.isLoading && viewModel.error == nil {
                Task {
                    await viewModel.checkBarcode(for: response)
                }
            }
        }
        .accessibilityElement()
        .accessibilityIdentifier(AccessibilityIdentifier.Scanner.barcode)
        .overlay(alignment: .center) {
            ScannerOverlay(
                isPresented: $viewModel.isPresentingIndicator,
                systemImage: "barcode.viewfinder"
            )
        }
        .overlay {
            if viewModel.isLoading {
                ProgressView()
                    .controlSize(.extraLarge)
                    .padding(Constants.Padding.sizeL)
                    .background(
                        Material.regular,
                        in: .rect(cornerRadius: Constants.Radius.Normal)
                    )
            }
        }
        .overlay(alignment: .center) {
            ErrorToast(error: $viewModel.error)
        }
    }
}

#Preview {
    BarCodeScannerView()
}
