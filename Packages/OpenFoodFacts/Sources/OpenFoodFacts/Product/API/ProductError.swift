import Foundation

public enum ProductError: LocalizedError {
    case productNotFound(_ status: String)

    public var errorDescription: String? {
        switch self {
        case .productNotFound(let status):
            status
        }
    }
}
