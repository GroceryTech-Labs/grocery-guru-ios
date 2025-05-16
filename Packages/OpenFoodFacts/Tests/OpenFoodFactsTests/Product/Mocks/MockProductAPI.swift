@testable import OpenFoodFacts

class MockProductAPI: ProductAPI {
    func fetchProduct(barcode: String) async throws -> APIProductItem {
        let response = APIProductItem(
            code: barcode,
            productName: "Spezi",
            nutriments: .example
        )

        if barcode == "error" {
            throw ProductError.productNotFound("Product not found")
        }

        return response
    }
}
