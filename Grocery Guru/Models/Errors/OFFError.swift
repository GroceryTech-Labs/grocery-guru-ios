import Foundation

enum OFFError: LocalizedError {
    case productNotFound(_ status: String)

    var errorDescription: String? {
        switch self {
        case .productNotFound(let status):
            status
        }
    }
}
