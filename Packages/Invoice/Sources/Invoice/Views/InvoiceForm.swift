import SwiftUI
import OpenFoodFacts
import DesignSystem
import Categories
import LocalStorage

public struct InvoiceForm: View {
    enum Field: Hashable {
        case amount
        case name
        case market
    }

    @State private var viewModel: InvoiceFormViewModel
    @FocusState private var focusedField: Field?

    public var body: some View {
        ScrollView {
            SectionHeader("Add Item") {
                VStack(spacing: Constants.Padding.sizeXL) {
                    NameRow(name: $viewModel.name)
                        .focused($focusedField, equals: .name)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedField = .amount
                        }

                    AmountRow(amount: $viewModel.amount, measureUnit: $viewModel.measureUnit)
                        .focused($focusedField, equals: .amount)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedField = nil
                        }

                    CategoryPickerRow(
                        selectedCategory: $viewModel.category,
                        repository: CategoryRepositoryImpl()
                    )

//                    NutrimentsRow(
//                        isExpanded: $viewModel.isPresentingNutriments,
//                        nutriments: viewModel.nutriments
//                    )

                    FormsAddInvoiceButton(
                        viewModel: viewModel,
                        focusedField: _focusedField
                    )
                }
            }
            .padding(.horizontal, Constants.Padding.sizeL)
        }
        .scrollIndicators(.hidden)
    }

    public init(code: String? = nil, name: String? = nil) {
        viewModel = InvoiceFormViewModel(
            navigationService: .shared,
            code: code,
            name: name ?? ""
        )
    }
}
