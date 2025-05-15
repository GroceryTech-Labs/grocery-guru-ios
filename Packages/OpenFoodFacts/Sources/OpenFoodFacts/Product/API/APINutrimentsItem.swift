import Foundation

public struct APINutrimentsItem: Sendable {
    public let carbohydrates100g: Float?
    public let carbohydratesUnit: String?
    public let energyKcal100g: Float?
    public let energyKcalUnit: String?
    public let energyKJ100g: Float?
    public let energyKJUnit: String?
    public let fat100g: Float?
    public let fatUnit: String?
    public let proteins100g: Float?
    public let proteinsUnit: String?
    public let salt100g: Float?
    public let saltUnit: String?
    public let sugars100g: Float?
    public let sugarsUnit: String?

    public init(
        carbohydrates100g: Float?,
        carbohydratesUnit: String?,
        energyKcal100g: Float?,
        energyKcalUnit: String?,
        energyKJ100g: Float?,
        energyKJUnit: String?,
        fat100g: Float?,
        fatUnit: String?,
        proteins100g: Float?,
        proteinsUnit: String?,
        salt100g: Float?,
        saltUnit: String?,
        sugars100g: Float?,
        sugarsUnit: String?
    ) {
        self.carbohydrates100g = carbohydrates100g
        self.carbohydratesUnit = carbohydratesUnit
        self.energyKcal100g = energyKcal100g
        self.energyKcalUnit = energyKcalUnit
        self.energyKJ100g = energyKJ100g
        self.energyKJUnit = energyKJUnit
        self.fat100g = fat100g
        self.fatUnit = fatUnit
        self.proteins100g = proteins100g
        self.proteinsUnit = proteinsUnit
        self.salt100g = salt100g
        self.saltUnit = saltUnit
        self.sugars100g = sugars100g
        self.sugarsUnit = sugarsUnit
    }
}

extension APINutrimentsItem: Codable {
    enum CodingKeys: String, CodingKey {
        case carbohydrates100g = "carbohydrates_100g"
        case carbohydratesUnit = "carbohydrates_unit"
        case energyKcal100g = "energy-kcal_100g"
        case energyKcalUnit = "energy-kcal_unit"
        case energyKJ100g = "energy-kj_100g"
        case energyKJUnit = "energy-kj_unit"
        case fat100g = "fat_100g"
        case fatUnit = "fat_unit"
        case proteins100g = "proteins_100g"
        case proteinsUnit = "proteins_unit"
        case salt100g = "salt_100g"
        case saltUnit = "salt_unit"
        case sugars100g = "sugars_100g"
        case sugarsUnit = "sugars_unit"
    }
}
