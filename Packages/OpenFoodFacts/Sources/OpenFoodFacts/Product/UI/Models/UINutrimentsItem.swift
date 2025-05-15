import Foundation

public struct UINutrimentsItem: Hashable, Equatable, Identifiable, Sendable {
    public let id = UUID()

    public var carbohydrates100g: Float?
    public var carbohydratesUnit: String?
    public var energyKcal100g: Float?
    public var energyKcalUnit: String?
    public var energyKJ100g: Float?
    public var energyKJUnit: String?
    public var fat100g: Float?
    public var fatUnit: String?
    public var proteins100g: Float?
    public var proteinsUnit: String?
    public var salt100g: Float?
    public var saltUnit: String?
    public var sugars100g: Float?
    public var sugarsUnit: String?
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

extension UINutrimentsItem {
    static let example = UINutrimentsItem(
        carbohydrates100g: 9.2,
        carbohydratesUnit: "g",
        energyKcal100g: 37,
        energyKcalUnit: "kcal",
        energyKJ100g: 158,
        energyKJUnit: "kj",
        fat100g: 0,
        fatUnit: "g",
        proteins100g: 0,
        proteinsUnit: "g",
        salt100g: 0.04,
        saltUnit: "g",
        sugars100g: 9.2,
        sugarsUnit: "g"
    )
}
