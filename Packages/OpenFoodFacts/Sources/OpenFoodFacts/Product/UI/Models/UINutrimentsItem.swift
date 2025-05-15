import Foundation

public struct UINutrimentsItem: Hashable, Equatable, Identifiable, Sendable {
    public let id = UUID()

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
}

extension UINutrimentsItem {
    init(from apiItem: APINutrimentsItem) {
        carbohydrates100g = apiItem.carbohydrates100g
        carbohydratesUnit = apiItem.carbohydratesUnit
        energyKcal100g = apiItem.energyKcal100g
        energyKcalUnit = apiItem.energyKcalUnit
        energyKJ100g = apiItem.energyKJ100g
        energyKJUnit = apiItem.energyKJUnit
        fat100g = apiItem.fat100g
        fatUnit = apiItem.fatUnit
        proteins100g = apiItem.proteins100g
        proteinsUnit = apiItem.proteinsUnit
        salt100g = apiItem.salt100g
        saltUnit = apiItem.saltUnit
        sugars100g = apiItem.sugars100g
        sugarsUnit = apiItem.sugarsUnit
    }
}
