import SwiftUI

enum APIError: LocalizedError {
    // Status code 500
    case internalServer

    case invalidURL

    case missingData

    // Status code 404
    case notFound

    // Status code 503
    case serviceUnavailable

    // Other status code
    case unknownStatus

    var errorDescription: String? {
        switch self {
        case .internalServer:
            "Internal server error."
        case .invalidURL:
            "Invalid server URL."
        case .missingData:
            "No data found."
        case .notFound:
            "Could not be found."
        case .serviceUnavailable:
            "Service currently not available."
        case .unknownStatus:
            "Unknown status."
        }
    }
}
