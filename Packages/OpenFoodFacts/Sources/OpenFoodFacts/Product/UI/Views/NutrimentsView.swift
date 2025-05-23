import SwiftUI
import DesignSystem

@Observable
final class NutrimentsViewModel {
    private var code: String
    var nutriments: UINutrimentsItem?

    init(code: String) {
        self.code = code
    }
}

public struct NutrimentsView: View {
    @State private var viewModel: NutrimentsViewModel

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
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding(Constants.Padding.sizeL)
    }

    public init(code: String) {
        viewModel = NutrimentsViewModel(code: code)
    }

    private var carbohydratesSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Carbohydrates",
                value: viewModel.nutriments?.carbohydrates100g,
                unit: viewModel.nutriments?.carbohydratesUnit
            )
        }
    }

    private var energyKcalSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Energy (kcal)",
                value: viewModel.nutriments?.energyKcal100g,
                unit: viewModel.nutriments?.energyKcalUnit
            )
        }
    }

    private var energyKJSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Energy (kJ)",
                value: viewModel.nutriments?.energyKJ100g,
                unit: viewModel.nutriments?.energyKJUnit
            )
        }
    }

    private var fatSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Fat",
                value: viewModel.nutriments?.fat100g,
                unit: viewModel.nutriments?.fatUnit
            )
        }
    }

    private var proteinSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Proteins",
                value: viewModel.nutriments?.proteins100g,
                unit: viewModel.nutriments?.proteinsUnit
            )
        }
    }

    private var saltSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Salt",
                value: viewModel.nutriments?.salt100g,
                unit: viewModel.nutriments?.saltUnit
            )
        }
    }

    private var sugarsSection: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            valueUnitTextRow(
                title: "Sugars",
                value: viewModel.nutriments?.sugars100g,
                unit: viewModel.nutriments?.sugarsUnit
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
