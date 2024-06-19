import Foundation
@testable import Grocery_Guru

class MockAPIService: APIService {

    let requestType: OFFAPIConfig.Request

    init(requestType: OFFAPIConfig.Request) {
        self.requestType = requestType
        super.init(session: URLSession(configuration: .ephemeral))
    }

    override func request<Item: Decodable>(
        _ type: Item.Type,
        url: URL,
        method: HTTPMethod
    ) async throws -> Item {
        print("🔵 Mock Request: \(url.absoluteString)")

        switch requestType {
        case .product:
            let url = Bundle.main.url(forResource: "off_nutriments", withExtension: "json")!
            guard let data = try? Data(contentsOf: url) else {
                fatalError("Failed to load off_nutriments from bundle.")
            }

            return try JSONDecoder().decode(Item.self, from: data)
        }
    }
}
