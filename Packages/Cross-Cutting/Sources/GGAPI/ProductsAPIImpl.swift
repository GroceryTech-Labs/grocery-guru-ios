import Foundation
import OpenFoodFacts

@MainActor
public class ProductAPIImpl: ProductAPI {
    private let ggAPI: GGAPI

    public init(_ apiBaseURL: String) {
        ggAPI = GGAPIImpl(apiBaseURL)
    }

    init(ggAPI: GGAPI) {
        self.ggAPI = ggAPI
    }
}

// MARK: - fetch()
extension ProductAPIImpl {
    public func fetchProduct(barcode: String) async throws -> APIProductItem {
        let request = GETProductRequest(barcode)
        let response = try await ggAPI.request(request)

        guard response.status == 1 else {
            throw ProductError.productNotFound(response.statusVerbose)
        }

        return convert(response)
    }

    private func convert(_ apiProduct: GETProductResponseElement) -> APIProductItem {
        return APIProductItem(
            productName: apiProduct.product?.productName,
            nutriments: APINutrimentsItem(
                carbohydrates100g: apiProduct.product?.nutriments.carbohydrates100g,
                carbohydratesUnit: apiProduct.product?.nutriments.carbohydratesUnit,
                energyKcal100g: apiProduct.product?.nutriments.energyKcal100g,
                energyKcalUnit: apiProduct.product?.nutriments.energyKcalUnit,
                energyKJ100g: apiProduct.product?.nutriments.energyKJ100g,
                energyKJUnit: apiProduct.product?.nutriments.energyKJUnit,
                fat100g: apiProduct.product?.nutriments.fat100g,
                fatUnit: apiProduct.product?.nutriments.fatUnit,
                proteins100g: apiProduct.product?.nutriments.proteins100g,
                proteinsUnit: apiProduct.product?.nutriments.proteinsUnit,
                salt100g: apiProduct.product?.nutriments.salt100g,
                saltUnit: apiProduct.product?.nutriments.saltUnit,
                sugars100g: apiProduct.product?.nutriments.sugars100g,
                sugarsUnit: apiProduct.product?.nutriments.sugarsUnit
            )
        )
    }
}
