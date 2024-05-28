import Foundation
import Vision
import VisionKit

final class TextRecognizerService {
    let cameraScan: VNDocumentCameraScan
    
    init(cameraScan: VNDocumentCameraScan) {
        self.cameraScan = cameraScan
    }
    
    // Own thread for handling the scan
    private let queue = DispatchQueue(
        label: "document-scan",
        qos: .default,
        attributes: [],
        autoreleaseFrequency: .workItem
    )
    
    func recognizeText(withCompletionHandler completionHandler: @escaping ([ScannedString]) -> Void) {
        queue.async {
            let images = (0..<self.cameraScan.pageCount).compactMap {
                self.cameraScan.imageOfPage(at: $0).cgImage
            }
            
            let imagesAndRequests = images.map {
                (image: $0, request: VNRecognizeTextRequest())
            }
            
            var strings: [ScannedString] = []
            
            for (image, request) in imagesAndRequests {
                let handler = VNImageRequestHandler(cgImage: image, options: [:])
                
                do {
                    try handler.perform([request])
                    
                    guard let observations = request.results else {
                        return
                    }
                    
                    for observation in observations {
                        if let string = observation.topCandidates(1).first?.string {
                            strings.append(ScannedString(value: string))
                        }
                    }
                    
                    DispatchQueue.main.async {
                        completionHandler(strings)
                    }
                } catch {
                    print(error)
                    return
                }
            }
        }
    }
}
