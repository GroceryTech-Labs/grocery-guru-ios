import Foundation

struct OFFProduct: Codable, Hashable {
    enum CodingKeys: String, CodingKey {
        case nutriments = "nutriments"
        case productName = "product_name"
    }

    static let example = Self(
        nutriments: Bundle.main.decode(
            OFFNutriments.self,
            from: "off_nutriments.json"
        ),
        productName: "Paulaner Spezi"
    )

    let nutriments: OFFNutriments
    let productName: String
}
