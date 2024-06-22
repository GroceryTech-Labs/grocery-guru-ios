import Foundation

struct OFFProduct: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case nutriments = "nutriments"
        case productName = "product_name"
    }

    let nutriments: OFFNutriments
    let productName: String

    static let example: OFFProduct = OFFProduct(
        nutriments: Bundle.main.decode(
            OFFNutriments.self,
            from: "off_nutriments.json"
        ),
        productName: "Paulaner Spezi"
    )
}
