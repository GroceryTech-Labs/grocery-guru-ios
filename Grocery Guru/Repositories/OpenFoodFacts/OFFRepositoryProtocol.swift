import Foundation

protocol OFFRepositoryProtocol {
    func getProductResult(barcode: String) async throws -> OFFProductResult
}
