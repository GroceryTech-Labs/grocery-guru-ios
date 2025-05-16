import Foundation

@MainActor
public protocol ProductAPI: Sendable {
    func fetchProduct(barcode: String) async throws -> APIProductItem
}
