@testable import OpenFoodFacts

class MockProductAPI: ProductAPI {
    func fetchProduct(barcode: String, fields: [ProductField]) async throws -> APIProductItem {
        let response = APIProductItem(
            code: barcode,
            productName: "Spezi",
            productQuantity: "500",
            productQuantityUnit: "g",
            nutriments: .example
        )

        if barcode == "error" {
            throw ProductError.productNotFound("Product not found")
        }

        return response
    }
}
