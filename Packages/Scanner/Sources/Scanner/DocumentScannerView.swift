import VisionKit
import SwiftUI
import Routing

public struct DocumentScannerView: UIViewControllerRepresentable {
    public typealias UIViewControllerType = VNDocumentCameraViewController

    final public class Coordinator: NSObject, @preconcurrency VNDocumentCameraViewControllerDelegate {
        /// Result of the saved scan scans
        private let completionHandler: ([String]) -> Void

        /// Handling action on dismissing the view in any way
        private let onDismiss: () -> Void

        init(onDismiss: @escaping () -> Void, completion: @escaping ([String]) -> Void) {
            self.completionHandler = completion
            self.onDismiss = onDismiss
        }

        @MainActor public func documentCameraViewController(
            _ controller: VNDocumentCameraViewController,
            didFinishWith scan: VNDocumentCameraScan
        ) {
            print("Document camera view controller did finish with ", scan)
            let recognizer = TextRecognizerService(cameraScan: scan)
            recognizer.recognizeText(withCompletionHandler: completionHandler)
        }

        // Gets called when the view scan gets canceled
        public func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            onDismiss()
            completionHandler([])
        }

        public func documentCameraViewController(
            _ controller: VNDocumentCameraViewController,
            didFailWithError error: Error
        ) {
            print("Document camera view controller did finish with error ", error)
            completionHandler([])
        }
    }

    private let completionHandler: ([String]) -> Void

    @Environment(\.navigationService)
    private var navigator

    public init(completion: @escaping ([String]) -> Void) {
        self.completionHandler = completion
    }

    public func makeUIViewController(
        context: UIViewControllerRepresentableContext<Self>
    ) -> VNDocumentCameraViewController {
        let viewController = VNDocumentCameraViewController()
        viewController.delegate = context.coordinator
        return viewController
    }

    public func updateUIViewController(
        _ uiViewController: VNDocumentCameraViewController,
        context: UIViewControllerRepresentableContext<Self>
    ) { }

    public func makeCoordinator() -> Coordinator {
        Coordinator(
            onDismiss: { navigator.drop() },
            completion: completionHandler
        )
    }
}
