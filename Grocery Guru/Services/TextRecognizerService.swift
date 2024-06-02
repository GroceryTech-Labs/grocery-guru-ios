import Foundation
import Vision
import VisionKit

final class TextRecognizerService {
    let cameraScan: VNDocumentCameraScan

    // Own thread for handling the scan
    private let queue = DispatchQueue(
        label: "document-scan",
        qos: .default,
        attributes: [],
        autoreleaseFrequency: .workItem
    )

    init(cameraScan: VNDocumentCameraScan) {
        self.cameraScan = cameraScan
    }

    func recognizeText(withCompletionHandler completionHandler: @escaping ([String]) -> Void) {
        queue.async {
            let images = (0..<self.cameraScan.pageCount).compactMap { index in
                self.cameraScan.imageOfPage(at: index).cgImage
            }

            let imagesAndRequests = images.map { image in
                (image: image, request: VNRecognizeTextRequest())
            }

            var strings: [String] = []

            for (image, request) in imagesAndRequests {
                let handler = VNImageRequestHandler(cgImage: image, options: [:])

                do {
                    try handler.perform([request])

                    guard let observations = request.results else {
                        return
                    }

                    for observation in observations {
                        if let string = observation.topCandidates(1).first?.string {
                            strings.append(string)
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
