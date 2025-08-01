import Foundation
import OpenFoodFacts

final class GETProductRequest: ProductAPIRequest, @unchecked Sendable {
    init(_ barcode: String, fields: [ProductField]) {
        super.init("/product/\(barcode)")
        queryItems = [
            URLQueryItem(
                name: "fields",
                value: GETProductRequest.getFieldsString(fields: fields)
            )
        ]
    }

    private static func getFieldsString(fields: [ProductField]) -> String {
        return fields.map { $0.rawValue }.joined(separator: ",")
    }
}
