import Foundation

final class OFFRepository: OFFRepositoryProtocol {
    static var shared = OFFRepository()

    lazy var apiService = APIService.shared
    lazy var config = OFFAPIConfig.shared

    private init() { }

    func getProductResult(barcode: String) async throws -> OFFProductResult {
        guard let url = URL(
            string: config.baseURL + OFFEndpoints.product(barcode: barcode).string
        ) else {
            throw APIError.invalidURL
        }

        return try await apiService.request(OFFProductResult.self, url: url, method: .get)
    }
}
