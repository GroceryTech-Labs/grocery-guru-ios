import SwiftUI
import CodeScanner
import DesignSystem
import GGAPI
import OpenFoodFacts

struct BarcodeScannerView: View {
    @State private var viewModel = BarcodeScannerViewModel(
        productAPI: ProductAPIImpl(OpenFoodFactsEndpoint.baseURL)
    )

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
    }
}

#Preview {
    BarcodeScannerView()
}
