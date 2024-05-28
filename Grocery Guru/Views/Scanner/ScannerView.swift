import VisionKit
import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    private let completionHandler: ([ScannedString]?) -> Void
    
    @Environment(\.presentationMode) private var presentationMode
     
    init(completion: @escaping ([ScannedString]?) -> Void) {
        self.completionHandler = completion
    }
     
    typealias UIViewControllerType = VNDocumentCameraViewController
     
    func makeUIViewController(
        context: UIViewControllerRepresentableContext<ScannerView>
    ) -> VNDocumentCameraViewController {
        let viewController = VNDocumentCameraViewController()
        viewController.delegate = context.coordinator
        return viewController
    }
     
    func updateUIViewController(
        _ uiViewController: VNDocumentCameraViewController,
        context: UIViewControllerRepresentableContext<ScannerView>
    ) {
        
    }
     
    func makeCoordinator() -> Coordinator {
        return Coordinator(
            onDismiss: {
                self.presentationMode.wrappedValue.dismiss()
            },
            completion: completionHandler
        )
    }
     
    final class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        /// Result of the saved scan scans
        private let completionHandler: ([ScannedString]?) -> Void
        
        /// Handling action on dismissing the view in any way
        private let onDismiss: () -> Void
         
        init(onDismiss: @escaping () -> Void, completion: @escaping ([ScannedString]?) -> Void) {
            self.completionHandler = completion
            self.onDismiss = onDismiss
        }
         
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            print("Document camera view controller did finish with ", scan)
            let recognizer = TextRecognizerService(cameraScan: scan)
            recognizer.recognizeText(withCompletionHandler: completionHandler)
        }
         
        // Gets called when the view scan gets canceled
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            onDismiss()
            completionHandler(nil)
        }
         
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            print("Document camera view controller did finish with error ", error)
            completionHandler(nil)
        }
    }
}
