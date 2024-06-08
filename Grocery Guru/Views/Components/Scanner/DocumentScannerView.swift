import VisionKit
import SwiftUI

struct DocumentScannerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = VNDocumentCameraViewController

    final class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        /// Result of the saved scan scans
        private let completionHandler: ([String]) -> Void

        /// Handling action on dismissing the view in any way
        private let onDismiss: () -> Void

        init(onDismiss: @escaping () -> Void, completion: @escaping ([String]) -> Void) {
            self.completionHandler = completion
            self.onDismiss = onDismiss
        }

        func documentCameraViewController(
            _ controller: VNDocumentCameraViewController,
            didFinishWith scan: VNDocumentCameraScan
        ) {
            print("Document camera view controller did finish with ", scan)
            let recognizer = TextRecognizerService(cameraScan: scan)
            recognizer.recognizeText(withCompletionHandler: completionHandler)
        }

        // Gets called when the view scan gets canceled
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            onDismiss()
            completionHandler([])
        }

        func documentCameraViewController(
            _ controller: VNDocumentCameraViewController,
            didFailWithError error: Error
        ) {
            print("Document camera view controller did finish with error ", error)
            completionHandler([])
        }
    }

    private let completionHandler: ([String]) -> Void

    @Environment(\.presentationMode)
    private var presentationMode

    init(completion: @escaping ([String]) -> Void) {
        self.completionHandler = completion
    }

    func makeUIViewController(
        context: UIViewControllerRepresentableContext<Self>
    ) -> VNDocumentCameraViewController {
        let viewController = VNDocumentCameraViewController()
        viewController.delegate = context.coordinator
        return viewController
    }

    func updateUIViewController(
        _ uiViewController: VNDocumentCameraViewController,
        context: UIViewControllerRepresentableContext<Self>
    ) { }

    func makeCoordinator() -> Coordinator {
        Coordinator(
            onDismiss: { presentationMode.wrappedValue.dismiss() },
            completion: completionHandler
        )
    }
}
