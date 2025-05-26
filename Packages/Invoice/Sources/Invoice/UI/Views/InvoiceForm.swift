import SwiftUI
import OpenFoodFacts
import DesignSystem
import Categories

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
                        categoryRepository: viewModel.categoryRepository
                    )

                    if let code = viewModel.code {
                        NutrimentsRow(
                            isExpanded: $viewModel.isPresentingNutriments,
                            code: code
                        )
                    }

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

    public init(
        categoryRepository: CategoryRepository,
        invoiceRepository: InvoiceRepository,
        code: String? = nil,
        name: String? = nil
    ) {
        viewModel = InvoiceFormViewModel(
            categoryRepository: categoryRepository,
            invoiceRepository: invoiceRepository,
            code: code,
            name: name ?? ""
        )
    }
}
