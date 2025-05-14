import XCTest
@testable import Grocery_Guru

final class APIServiceTests: XCTestCase {
    var sut: MockAPIService!

    override func setUp() {
        sut = MockAPIService(requestType: .product(barcode: "askjdk"))
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testRequestSuccess() async throws {
        // Given
        let url = URL(string: "https://test.com")!

        // When
        let result: OFFNutriments = try await sut.request(OFFNutriments.self, url: url, method: .get)

        // Then
        XCTAssertEqual(result, Bundle.main.decode(OFFNutriments.self, from: "off_nutriments.json"))
    }
}
