import Foundation

public struct UINutrimentsItem: Hashable, Equatable, Identifiable {
    public let id = UUID()

    public let carbohydrates: Float?
    public let carbohydrates100g: Float?
    public let carbohydratesServing: Float?
    public let carbohydratesUnit: String?
    public let carbohydratesValue: Float?
    public let carbonFootprintFromKnownIngredientsProduct: Float?
    public let carbonFootprintFromKnownIngredientsServing: Float?
    public let energy: Float?
    public let energyKcal: Float?
    public let energyKcal100g: Float?
    public let energyKcalServing: Float?
    public let energyKcalUnit: String?
    public let energyKcalValue: Float?
    public let energyKcalValueComputed: Float?
    public let energyKJ: Float?
    public let energyKJ100g: Float?
    public let energyKJServing: Float?
    public let energyKJUnit: String?
    public let energyKJValue: Float?
    public let energyKJValueComputed: Float?
    public let energy100g: Float?
    public let energyServing: Float?
    public let energyUnit: String?
    public let energyValue: Float?
    public let fat: Float?
    public let fat100g: Float?
    public let fatServing: Float?
    public let fatUnit: String?
    public let fatValue: Float?
    public let proteins: Float?
    public let proteins100g: Float?
    public let proteinsServing: Float?
    public let proteinsUnit: String?
    public let proteinsValue: Float?
    public let salt: Float?
    public let salt100g: Float?
    public let saltServing: Float?
    public let saltUnit: String?
    public let saltValue: Float?
    public let saturatedFat: Float?
    public let saturatedFat100g: Float?
    public let saturatedFatServing: Float?
    public let saturatedFatUnit: String?
    public let saturatedFatValue: Float?
    public let sodium: Float?
    public let sodium100g: Float?
    public let sodiumServing: Float?
    public let sodiumUnit: String?
    public let sodiumValue: Float?
    public let sugars: Float?
    public let sugars100g: Float?
    public let sugarsServing: Float?
    public let sugarsUnit: String?
    public let sugarsValue: Float?
}
