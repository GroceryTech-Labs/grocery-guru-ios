import VisionKit
import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    private let completionHandler: ([String]?) -> Void
    
    @Environment(\.presentationMode) private var presentationMode
     
    init(completion: @escaping ([String]?) -> Void) {
        self.completionHandler = completion
    }
     
    typealias UIViewControllerType = VNDocumentCameraViewController
     
    func makeUIViewController(context: UIViewControllerRepresentableContext<ScannerView>) -> VNDocumentCameraViewController {
        let viewController = VNDocumentCameraViewController()
        viewController.delegate = context.coordinator
        return viewController
    }
     
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: UIViewControllerRepresentableContext<ScannerView>) {
        
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
        private let completionHandler: ([String]?) -> Void
        private let onDismiss: () -> Void
         
        init(onDismiss: @escaping () -> Void, completion: @escaping ([String]?) -> Void) {
            self.completionHandler = completion
            self.onDismiss = onDismiss
        }
         
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            print("Document camera view controller did finish with ", scan)
            let recognizer = TextRecognizer(cameraScan: scan)
            recognizer.recognizeText(withCompletionHandler: completionHandler)
        }
         
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
