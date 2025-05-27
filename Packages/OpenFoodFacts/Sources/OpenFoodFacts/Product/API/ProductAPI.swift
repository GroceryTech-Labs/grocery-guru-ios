import Foundation

@MainActor
public protocol ProductAPI: Sendable {
    func fetchProduct(barcode: String, fields: [ProductField]) async throws -> APIProductItem
}

extension ProductAPI {
    public func fetchProduct(barcode: String, fields: [ProductField] = []) async throws -> APIProductItem {
        try await fetchProduct(barcode: barcode, fields: fields)
    }
}
