import Testing
@testable import OpenFoodFacts

@Suite("Product tests") struct ProductTests {

    var api: ProductAPI

    init() async throws {
        api = MockProductAPI()
    }

    @Test func fetchProduct() async throws {
        let result = try await api.fetchProduct(barcode: "")
        #expect(result.productName == "Spezi")
    }

    @Test func fetchProductFailure() async {
        do {
            _ = try await api.fetchProduct(barcode: "error")
        } catch {
            #expect(error.localizedDescription == "Product not found")
        }
    }
}
