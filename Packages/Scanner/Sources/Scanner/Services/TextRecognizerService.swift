import Foundation
import Vision
@preconcurrency import VisionKit

final class TextRecognizerService: Sendable {
    let cameraScan: VNDocumentCameraScan

    init(cameraScan: VNDocumentCameraScan) {
        self.cameraScan = cameraScan
    }

    @MainActor
    func recognizeText(withCompletionHandler completionHandler: @escaping ([String]) -> Void) {
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

                completionHandler(strings)
            } catch {
                print(error)
                return
            }
        }
    }
}
