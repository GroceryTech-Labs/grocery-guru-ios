import Foundation

public struct APINutrimentsItem: Hashable, Sendable {
    public init(
        carbohydrates: Float? = nil,
        carbohydrates100g: Float? = nil,
        carbohydratesServing: Float? = nil,
        carbohydratesUnit: String? = nil,
        carbohydratesValue: Float? = nil,
        carbonFootprintFromKnownIngredientsProduct: Float? = nil,
        carbonFootprintFromKnownIngredientsServing: Float? = nil,
        energy: Float? = nil,
        energyKcal: Float? = nil,
        energyKcal100g: Float? = nil,
        energyKcalServing: Float? = nil,
        energyKcalUnit: String? = nil,
        energyKcalValue: Float? = nil,
        energyKcalValueComputed: Float? = nil,
        energyKJ: Float? = nil,
        energyKJ100g: Float? = nil,
        energyKJServing: Float? = nil,
        energyKJUnit: String? = nil,
        energyKJValue: Float? = nil,
        energyKJValueComputed: Float? = nil,
        energy100g: Float? = nil,
        energyServing: Float? = nil,
        energyUnit: String? = nil,
        energyValue: Float? = nil,
        fat: Float? = nil,
        fat100g: Float? = nil,
        fatServing: Float? = nil,
        fatUnit: String? = nil,
        fatValue: Float? = nil,
        proteins: Float? = nil,
        proteins100g: Float? = nil,
        proteinsServing: Float? = nil,
        proteinsUnit: String? = nil,
        proteinsValue: Float? = nil,
        salt: Float? = nil,
        salt100g: Float? = nil,
        saltServing: Float? = nil,
        saltUnit: String? = nil,
        saltValue: Float? = nil,
        saturatedFat: Float? = nil,
        saturatedFat100g: Float? = nil,
        saturatedFatServing: Float? = nil,
        saturatedFatUnit: String? = nil,
        saturatedFatValue: Float? = nil,
        sodium: Float? = nil,
        sodium100g: Float? = nil,
        sodiumServing: Float? = nil,
        sodiumUnit: String? = nil,
        sodiumValue: Float? = nil,
        sugars: Float? = nil,
        sugars100g: Float? = nil,
        sugarsServing: Float? = nil,
        sugarsUnit: String? = nil,
        sugarsValue: Float? = nil
    ) {
        self.carbohydrates = carbohydrates
        self.carbohydrates100g = carbohydrates100g
        self.carbohydratesServing = carbohydratesServing
        self.carbohydratesUnit = carbohydratesUnit
        self.carbohydratesValue = carbohydratesValue
        self.carbonFootprintFromKnownIngredientsProduct = carbonFootprintFromKnownIngredientsProduct
        self.carbonFootprintFromKnownIngredientsServing = carbonFootprintFromKnownIngredientsServing
        self.energy = energy
        self.energyKcal = energyKcal
        self.energyKcal100g = energyKcal100g
        self.energyKcalServing = energyKcalServing
        self.energyKcalUnit = energyKcalUnit
        self.energyKcalValue = energyKcalValue
        self.energyKcalValueComputed = energyKcalValueComputed
        self.energyKJ = energyKJ
        self.energyKJ100g = energyKJ100g
        self.energyKJServing = energyKJServing
        self.energyKJUnit = energyKJUnit
        self.energyKJValue = energyKJValue
        self.energyKJValueComputed = energyKJValueComputed
        self.energy100g = energy100g
        self.energyServing = energyServing
        self.energyUnit = energyUnit
        self.energyValue = energyValue
        self.fat = fat
        self.fat100g = fat100g
        self.fatServing = fatServing
        self.fatUnit = fatUnit
        self.fatValue = fatValue
        self.proteins = proteins
        self.proteins100g = proteins100g
        self.proteinsServing = proteinsServing
        self.proteinsUnit = proteinsUnit
        self.proteinsValue = proteinsValue
        self.salt = salt
        self.salt100g = salt100g
        self.saltServing = saltServing
        self.saltUnit = saltUnit
        self.saltValue = saltValue
        self.saturatedFat = saturatedFat
        self.saturatedFat100g = saturatedFat100g
        self.saturatedFatServing = saturatedFatServing
        self.saturatedFatUnit = saturatedFatUnit
        self.saturatedFatValue = saturatedFatValue
        self.sodium = sodium
        self.sodium100g = sodium100g
        self.sodiumServing = sodiumServing
        self.sodiumUnit = sodiumUnit
        self.sodiumValue = sodiumValue
        self.sugars = sugars
        self.sugars100g = sugars100g
        self.sugarsServing = sugarsServing
        self.sugarsUnit = sugarsUnit
        self.sugarsValue = sugarsValue
    }

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
