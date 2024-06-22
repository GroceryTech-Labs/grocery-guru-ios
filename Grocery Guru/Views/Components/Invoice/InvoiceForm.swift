import SwiftUI

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

                    CategoryRow(category: $viewModel.category)

                    NutrimentsRow(
                        product: $viewModel.product,
                        isExpanded: $viewModel.isPresentingNutriments
                    )

                    FormsAddInvoiceButton(
                        viewModel: $viewModel,
                        focusedField: _focusedField
                    )
                }
            }
            .padding(.horizontal, Constants.Padding.sizeL)
        }
        .scrollIndicators(.hidden)
    }

    init(product: OFFProduct? = nil) {
        viewModel = InvoiceFormViewModel(
            name: product?.productName ?? "",
            amount: product == nil ? "" : "1",
            measureUnit: .whole,
            category: .bakery,
            product: product
        )
    }
}

#Preview {
    InvoiceForm(
        product: OFFProduct(
            nutriments: Bundle.main.decode(
                OFFNutriments.self,
                from: "off_nutriments.json"
            ),
            productName: "Test"
        )
    )
}
