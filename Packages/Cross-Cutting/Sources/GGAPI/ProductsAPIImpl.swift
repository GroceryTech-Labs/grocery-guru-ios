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
        return convert(response)
    }

    private func convert(_ apiProduct: GETProductResponseElement) -> APIProductItem {
        return APIProductItem(
            productName: apiProduct.product?.productName,
            nutriments: APINutrimentsItem(
                carbohydrates: apiProduct.product?.nutriments.carbohydrates,
                carbohydrates100g: apiProduct.product?.nutriments.carbohydrates100g,
                carbohydratesServing: apiProduct.product?.nutriments.carbohydratesServing,
                carbohydratesUnit: apiProduct.product?.nutriments.carbohydratesUnit,
                carbohydratesValue: apiProduct.product?.nutriments.carbohydratesValue,
                carbonFootprintFromKnownIngredientsProduct: apiProduct.product?.nutriments.carbonFootprintFromKnownIngredientsProduct,
                carbonFootprintFromKnownIngredientsServing: apiProduct.product?.nutriments.carbonFootprintFromKnownIngredientsServing,
                energy: apiProduct.product?.nutriments.energy,
                energyKcal: apiProduct.product?.nutriments.energyKcal,
                energyKcal100g: apiProduct.product?.nutriments.energyKcal100g,
                energyKcalServing: apiProduct.product?.nutriments.energyKcalServing,
                energyKcalUnit: apiProduct.product?.nutriments.energyKcalUnit,
                energyKcalValue: apiProduct.product?.nutriments.energyKcalValue,
                energyKcalValueComputed: apiProduct.product?.nutriments.energyKcalValueComputed,
                energyKJ: apiProduct.product?.nutriments.energyKJ,
                energyKJ100g: apiProduct.product?.nutriments.energyKJ100g,
                energyKJServing: apiProduct.product?.nutriments.energyKJServing,
                energyKJUnit: apiProduct.product?.nutriments.energyKJUnit,
                energyKJValue: apiProduct.product?.nutriments.energyKJValue,
                energyKJValueComputed: apiProduct.product?.nutriments.energyKJValueComputed,
                energy100g: apiProduct.product?.nutriments.energy100g,
                energyServing: apiProduct.product?.nutriments.energyServing,
                energyUnit: apiProduct.product?.nutriments.energyUnit,
                energyValue: apiProduct.product?.nutriments.energyValue,
                fat: apiProduct.product?.nutriments.fat,
                fat100g: apiProduct.product?.nutriments.fat100g,
                fatServing: apiProduct.product?.nutriments.fatServing,
                fatUnit: apiProduct.product?.nutriments.fatUnit,
                fatValue: apiProduct.product?.nutriments.fatValue,
                proteins: apiProduct.product?.nutriments.proteins,
                proteins100g: apiProduct.product?.nutriments.proteins100g,
                proteinsServing: apiProduct.product?.nutriments.proteinsServing,
                proteinsUnit: apiProduct.product?.nutriments.proteinsUnit,
                proteinsValue: apiProduct.product?.nutriments.proteinsValue,
                salt: apiProduct.product?.nutriments.salt,
                salt100g: apiProduct.product?.nutriments.salt100g,
                saltServing: apiProduct.product?.nutriments.saltServing,
                saltUnit: apiProduct.product?.nutriments.saltUnit,
                saltValue: apiProduct.product?.nutriments.saltValue,
                saturatedFat: apiProduct.product?.nutriments.saturatedFat,
                saturatedFat100g: apiProduct.product?.nutriments.saturatedFat100g,
                saturatedFatServing: apiProduct.product?.nutriments.saturatedFatServing,
                saturatedFatUnit: apiProduct.product?.nutriments.saturatedFatUnit,
                saturatedFatValue: apiProduct.product?.nutriments.saturatedFatValue,
                sodium: apiProduct.product?.nutriments.sodium,
                sodium100g: apiProduct.product?.nutriments.sodium100g,
                sodiumServing: apiProduct.product?.nutriments.sodiumServing,
                sodiumUnit: apiProduct.product?.nutriments.sodiumUnit,
                sodiumValue: apiProduct.product?.nutriments.sodiumValue,
                sugars: apiProduct.product?.nutriments.sugars,
                sugars100g: apiProduct.product?.nutriments.sugars100g,
                sugarsServing: apiProduct.product?.nutriments.sugarsServing,
                sugarsUnit: apiProduct.product?.nutriments.sugarsUnit,
                sugarsValue: apiProduct.product?.nutriments.sugarsValue
            )
        )
    }
}
