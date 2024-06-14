import Foundation

struct OFFProductResult: Codable {
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case status = "status"
        case statusVerbose = "status_verbose"
        case product = "product"
    }

    let code: String
    let status: Int
    let statusVerbose: String
    let product: OFFProduct?
}
