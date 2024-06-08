import Foundation

enum OFFEndpoints {
    case product(barcode: String)

    var string: String {
        switch self {
        case .product(let barcode):
            "/product/\(barcode)"
        }
    }
}
