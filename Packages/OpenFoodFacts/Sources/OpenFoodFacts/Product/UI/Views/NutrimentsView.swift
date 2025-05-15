import SwiftUI
import DesignSystem

public struct NutrimentsView: View {
    public let nutriments: UINutrimentsItem

    public init(nutriments: UINutrimentsItem) {
        self.nutriments = nutriments
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeL) {
            carbohydratesSection
            energyKcalSection
            energyKJSection
            fatSection
            proteinSection
            saltSection
            sugarsSection
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(Constants.Padding.sizeL)
    }

    private var carbohydratesSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Carbohydrates:",
                value: nutriments.carbohydrates100g,
                unit: nutriments.carbohydratesUnit
            )
        }
    }

    private var energyKcalSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Energy (kcal):",
                value: nutriments.energyKcal100g,
                unit: nutriments.energyKcalUnit
            )
        }
    }

    private var energyKJSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Energy (kJ):",
                value: nutriments.energyKJ100g,
                unit: nutriments.energyKJUnit
            )
        }
    }

    private var fatSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Fat:",
                value: nutriments.fat100g,
                unit: nutriments.fatUnit
            )
        }
    }

    private var proteinSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Proteins:",
                value: nutriments.proteins100g,
                unit: nutriments.proteinsUnit
            )
        }
    }

    private var saltSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Salt:",
                value: nutriments.salt100g,
                unit: nutriments.saltUnit
            )
        }
    }

    private var sugarsSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Sugars:",
                value: nutriments.sugars100g,
                unit: nutriments.sugarsUnit
            )
        }
    }

    private func valueUnitTextRow(
        title: LocalizedStringKey,
        value: Float?,
        unit: String?
    ) -> some View {
        HStack {
            Text(title)
            Spacer()
            Group {
                if let value, let unit {
                    Text(verbatim: "\(value) \(unit)")
                } else {
                    Text(verbatim: "-")
                }
            }
            .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    NutrimentsView(nutriments: .sample)
}

extension UINutrimentsItem {
    static var sample: UINutrimentsItem {
        let data = Bundle.main.decode(APINutrimentsItem.self, from: "off_nutriments.json")
        return UINutrimentsItem(from: data)
    }
}
