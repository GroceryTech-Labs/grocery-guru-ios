import Foundation

final class OFFRepository: OFFRepositoryProtocol {
    static var shared = OFFRepository()

    lazy var apiService = APIService.shared
    lazy var config = OFFAPIConfig()

    private init() { }

    func getProductResult(barcode: String) async throws -> OFFProductResult {
        guard let url = URL(
            string: config.baseURL + OFFEndpoints.product(barcode: barcode).string
        ) else {
            throw APIError.invalidURL
        }

        let result = try await apiService.request(OFFProductResult.self, url: url, method: .get)

        guard result.status == 1 else {
            throw OFFError.productNotFound(result.statusVerbose)
        }

        return result
    }
}
