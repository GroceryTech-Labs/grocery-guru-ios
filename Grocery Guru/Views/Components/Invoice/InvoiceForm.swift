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
                NameRow(
                    viewModel: $viewModel,
                    focusedField: _focusedField
                )

                AmountRow(
                    viewModel: $viewModel,
                    focusedField: _focusedField
                )

                CategoryRow(viewModel: $viewModel)

                NutrimentsRow(viewModel: $viewModel)

                Spacer(minLength: Constants.Padding.sizeL)

                AddInvoiceButton(
                    viewModel: $viewModel,
                    focusedField: _focusedField
                )
            }
            .padding(Constants.Padding.sizeL)
            .textFieldStyle(.roundedBorder)
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
