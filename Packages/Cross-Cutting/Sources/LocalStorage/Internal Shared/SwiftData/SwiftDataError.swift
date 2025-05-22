import Foundation

public enum SwiftDataError: LocalizedError {
    case adding
    case fetch

    public var errorDescription: String? {
        switch self {
        case .adding:
            "Adding failed"
        case .fetch:
            "Fetching failed"
        }
    }
}
