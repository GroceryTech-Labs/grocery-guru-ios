import SwiftUI

struct OFFNutrimentsView: View {
    let nutriments: OFFNutriments

    var body: some View {
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
        .foregroundStyle(.labelPrimary)
        .background(Color.surfacePrimary, ignoresSafeAreaEdges: .all)
    }

    private var carbohydratesSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Carbohydrates:",
                value: nutriments.carbohydrates,
                unit: nutriments.carbohydratesUnit
            )
        }
    }

    private var energyKcalSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Energy (kcal):",
                value: nutriments.energyKcal,
                unit: nutriments.energyKcalUnit
            )
        }
    }

    private var energyKJSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Energy (kJ):",
                value: nutriments.energyKJ,
                unit: nutriments.energyKJUnit
            )
        }
    }

    private var fatSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Fat:",
                value: nutriments.fat,
                unit: nutriments.fatUnit
            )
        }
    }

    private var proteinSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Proteins:",
                value: nutriments.proteins,
                unit: nutriments.proteinsUnit
            )
        }
    }

    private var saltSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Salt:",
                value: nutriments.salt,
                unit: nutriments.saltUnit
            )
        }
    }

    private var sugarsSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Sugars:",
                value: nutriments.sugars,
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
            SectionHeader(title, font: .body)
            Spacer()
            Group {
                if let value, let unit {
                    Text(verbatim: "\(value) \(unit)")
                } else {
                    Text(verbatim: "-")
                }
            }
            .foregroundStyle(.labelSecondary)
        }
    }
}

#Preview {
    OFFNutrimentsView(
        nutriments: Bundle.main.decode(OFFNutriments.self, from: "off_nutriments.json")
    )
}
