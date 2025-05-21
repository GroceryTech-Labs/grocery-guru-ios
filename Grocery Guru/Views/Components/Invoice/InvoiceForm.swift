import SwiftUI
import OpenFoodFacts
import DesignSystem

struct InvoiceForm: View {
    enum Field: Hashable {
        case amount
        case name
        case market
    }

    @State private var viewModel: InvoiceFormViewModel
    @FocusState private var focusedField: Field?

    var body: some View {
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

                    CategoryPickerRow(selectedCategory: $viewModel.category)

                    NutrimentsRow(
                        isExpanded: $viewModel.isPresentingNutriments,
                        nutriments: viewModel.product?.nutriments
                    )

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

    init(product: UIProductItem? = nil) {
        viewModel = InvoiceFormViewModel(
            name: product?.productName ?? "",
            amount: product == nil ? "" : "1",
            measureUnit: .item,
            category: .bakery,
            product: product
        )
    }
}
