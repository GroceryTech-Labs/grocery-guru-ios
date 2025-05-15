import Foundation

typealias GETProductResponse = GETProductResponseElement

struct GETProductResponseElement: Decodable, Sendable {
    enum CodingKeys: String, CodingKey {
        case code, status, product
        case statusVerbose = "status_verbose"
    }

    let code: String
    let status: Int
    let statusVerbose: String
    let product: ProductDTO?
}

struct ProductDTO: Decodable, Sendable {
    enum CodingKeys: String, CodingKey {
        case nutriments
        case productName = "product_name"
    }

    let nutriments: NutrimentsDTO
    let productName: String
}

struct NutrimentsDTO: Decodable, Sendable {

    // swiftlint:disable identifier_name

    enum CodingKeys: String, CodingKey {
        case carbohydrates = "carbohydrates"
        case carbohydrates100g = "carbohydrates_100g"
        case carbohydratesServing = "carbohydrates_serving"
        case carbohydratesUnit = "carbohydrates_unit"
        case carbohydratesValue = "carbohydrates_value"
        case carbonFootprintFromKnownIngredientsProduct = "carbon-footprint-from-known-ingredients_product"
        case carbonFootprintFromKnownIngredientsServing = "carbon-footprint-from-known-ingredients_serving"
        case energy = "energy"
        case energyKcal = "energy-kcal"
        case energyKcal100g = "energy-kcal_100g"
        case energyKcalServing = "energy-kcal_serving"
        case energyKcalUnit = "energy-kcal_unit"
        case energyKcalValue = "energy-kcal_value"
        case energyKcalValueComputed = "energy-kcal_value_computed"
        case energyKJ = "energy-kj"
        case energyKJ100g = "energy-kj_100g"
        case energyKJServing = "energy-kj_serving"
        case energyKJUnit = "energy-kj_unit"
        case energyKJValue = "energy-kj_value"
        case energyKJValueComputed = "energy-kj_value_computed"
        case energy100g = "energy_100g"
        case energyServing = "energy_serving"
        case energyUnit = "energy_unit"
        case energyValue = "energy_value"
        case fat = "fat"
        case fat100g = "fat_100g"
        case fatServing = "fat_serving"
        case fatUnit = "fat_unit"
        case fatValue = "fat_value"
        case proteins = "proteins"
        case proteins100g = "proteins_100g"
        case proteinsServing = "proteins_serving"
        case proteinsUnit = "proteins_unit"
        case proteinsValue = "proteins_value"
        case salt = "salt"
        case salt100g = "salt_100g"
        case saltServing = "salt_serving"
        case saltUnit = "salt_unit"
        case saltValue = "salt_value"
        case saturatedFat = "saturated-fat"
        case saturatedFat100g = "saturated-fat_100g"
        case saturatedFatServing = "saturated-fat_serving"
        case saturatedFatUnit = "saturated-fat_unit"
        case saturatedFatValue = "saturated-fat_value"
        case sodium = "sodium"
        case sodium100g = "sodium_100g"
        case sodiumServing = "sodium_serving"
        case sodiumUnit = "sodium_unit"
        case sodiumValue = "sodium_value"
        case sugars = "sugars"
        case sugars100g = "sugars_100g"
        case sugarsServing = "sugars_serving"
        case sugarsUnit = "sugars_unit"
        case sugarsValue = "sugars_value"
    }

    let carbohydrates: Float?
    let carbohydrates100g: Float?
    let carbohydratesServing: Float?
    let carbohydratesUnit: String?
    let carbohydratesValue: Float?
    let carbonFootprintFromKnownIngredientsProduct: Float?
    let carbonFootprintFromKnownIngredientsServing: Float?
    let energy: Float?
    let energyKcal: Float?
    let energyKcal100g: Float?
    let energyKcalServing: Float?
    let energyKcalUnit: String?
    let energyKcalValue: Float?
    let energyKcalValueComputed: Float?
    let energyKJ: Float?
    let energyKJ100g: Float?
    let energyKJServing: Float?
    let energyKJUnit: String?
    let energyKJValue: Float?
    let energyKJValueComputed: Float?
    let energy100g: Float?
    let energyServing: Float?
    let energyUnit: String?
    let energyValue: Float?
    let fat: Float?
    let fat100g: Float?
    let fatServing: Float?
    let fatUnit: String?
    let fatValue: Float?
    let proteins: Float?
    let proteins100g: Float?
    let proteinsServing: Float?
    let proteinsUnit: String?
    let proteinsValue: Float?
    let salt: Float?
    let salt100g: Float?
    let saltServing: Float?
    let saltUnit: String?
    let saltValue: Float?
    let saturatedFat: Float?
    let saturatedFat100g: Float?
    let saturatedFatServing: Float?
    let saturatedFatUnit: String?
    let saturatedFatValue: Float?
    let sodium: Float?
    let sodium100g: Float?
    let sodiumServing: Float?
    let sodiumUnit: String?
    let sodiumValue: Float?
    let sugars: Float?
    let sugars100g: Float?
    let sugarsServing: Float?
    let sugarsUnit: String?
    let sugarsValue: Float?

    // swiftlint:enable identifier_name
}
