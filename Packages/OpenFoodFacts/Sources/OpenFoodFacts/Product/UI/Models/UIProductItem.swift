import Foundation

public struct UIProductItem: Hashable, Equatable, Identifiable {
//    static let example = Self(
//        nutriments: Bundle.main.decode(
//            OFFNutriments.self,
//            from: "off_nutriments.json"
//        ),
//        productName: "Paulaner Spezi"
//    )

    public let id = UUID()
    public let productName: String?
    public let nutriments: UINutrimentsItem
}

extension UIProductItem {
    public init(from apiItem: APIProductItem) {
        productName = apiItem.productName
        nutriments = UINutrimentsItem(from: apiItem.nutriments)
    }
}
