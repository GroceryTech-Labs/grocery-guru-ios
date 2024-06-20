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
            VStack(alignment: .leading, spacing: Constants.Padding.sizeL) {
                SectionHeader("Add Item") {
                    VStack(alignment: .leading, spacing: Constants.Padding.sizeL) {
                        nameRow

                        amountAndMeasureUnitRow

                        categoryRow
                    }
                    .textFieldStyle(.roundedBorder)
                }

                if let product = viewModel.product {
                    DisclosureGroup(isExpanded: $viewModel.isPresentingNutriments) {
                        OFFNutrimentsView(nutriments: product.nutriments)
                    } label: {
                        Text("Nutriments (100g)")
                            .font(.headline)
                            .accessibilityIdentifier(AccessibilityIdentifier.Button.invoiceFormNutriments)
                    }
                }

                Spacer(minLength: Constants.Padding.sizeL)

                addInvoiceButton
            }
        }
        .scrollIndicators(.hidden)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
        .padding(Constants.Padding.sizeL)
    }

    private var addInvoiceButton: some View {
        Button {
            guard !viewModel.name.isEmpty else {
                focusedField = .name
                return
            }

            guard !viewModel.amount.isEmpty else {
                focusedField = .amount
                return
            }

            viewModel.addInvoice()
        } label: {
            Text("Add to inventory")
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .accessibilityIdentifier(AccessibilityIdentifier.Button.invoiceFormSubmit)
    }

    private var amountAndMeasureUnitRow: some View {
        SectionHeader("Amount", font: .headline) {
            HStack {
                TextField(
                    "Amount",
                    text: $viewModel.amount,
                    prompt: Text(viewModel.measureUnit == .gram ? "200" : "2")
                )
                .keyboardType(.numberPad)
                .focused($focusedField, equals: .amount)
                .submitLabel(.next)
                .onSubmit {
                    focusedField = nil
                }
                .accessibilityIdentifier(AccessibilityIdentifier.TextField.invoiceFormAmount)

                MeasureUnitPicker($viewModel.measureUnit)
            }
        }
    }

    private var nameRow: some View {
        SectionHeader("Name", font: .headline) {
            TextField(
                "Name",
                text: $viewModel.name,
                prompt: Text("Pringles")
            )
            .focused($focusedField, equals: .name)
            .submitLabel(.next)
            .onSubmit {
                focusedField = .amount
            }
            .accessibilityIdentifier(
                AccessibilityIdentifier.TextField.invoiceFormName
            )
        }
    }

    private var categoryRow: some View {
        SectionHeader("Category", font: .headline) {
            InvoiceCategoryPicker(selection: $viewModel.category)
        }
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
