import SwiftUI

struct InvoiceForm: View {
    enum Field: Hashable {
        case amount
        case name
        case market
    }

    @State private var name: String
    @State private var amount: String
    @State private var measureUnit: MeasureUnit
    @State private var category: InvoiceItemCategory
    @State private var product: OFFProduct?
    @State private var isPresentingNutriments = false
    @FocusState private var focusedField: Field?

    @Environment(\.navigationService)
    private var navigator

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Constants.Padding.sizeL) {
                SectionHeader("Add Item")

                VStack(alignment: .leading, spacing: Constants.Padding.sizeL) {
                    nameRow

                    amountAndMeasureUnitRow

                    //                    marketRow

                    categoryRow
                }
                .textFieldStyle(.roundedBorder)

                if let product {
                    DisclosureGroup(isExpanded: $isPresentingNutriments) {
                        OFFNutrimentsView(nutriments: product.nutriments)
                    } label: {
                        Text("Nutriments (100g)")
                            .font(.headline)
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
            guard !name.isEmpty else {
                focusedField = .name
                return
            }

            guard !amount.isEmpty else {
                focusedField = .amount
                return
            }

            Task {
                do {
                    try AppConfig.shared.usedLocalRepository.addItem(
                        InvoiceItem(
                            name: name,
                            amount: Int(amount) ?? 0,
                            category: category,
                            measureUnit: measureUnit
                        )
                    )
                    navigator.drop()
                } catch {
                    print(error.localizedDescription)
                }
            }
        } label: {
            Text("Add to inventory")
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .accessibilityIdentifier(AccessibilityIdentifier.Button.invoiceFormSubmit)
    }

    private var amountAndMeasureUnitRow: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            Text("Amount")
                .font(.headline)

            HStack {
                TextField("Amount", text: $amount, prompt: Text(measureUnit == .gram ? "200" : "2"))
                    .keyboardType(.numberPad)
                    .focused($focusedField, equals: .amount)
                    .submitLabel(.next)
                    .onSubmit {
                        focusedField = nil
                    }
                    .accessibilityIdentifier(AccessibilityIdentifier.TextField.invoiceFormAmount)

                Picker("Measure Unit", selection: $measureUnit) {
                    ForEach(MeasureUnit.allCases, id: \.hashValue) { unit in
                        Text(unit.localized)
                            .tag(unit)
                    }
                }
            }
        }
    }

    private var nameRow: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            Text("Name")
                .font(.headline)

            TextField("Name", text: $name, prompt: Text("Pringles"))
                .focused($focusedField, equals: .name)
                .submitLabel(.next)
                .onSubmit {
                    focusedField = .amount
                }
                .accessibilityIdentifier(AccessibilityIdentifier.TextField.invoiceFormName)
        }
    }

    private var categoryRow: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            Text("Category")
                .font(.headline)

            InvoiceItemCategory.Picker(selection: $category)
        }
    }

    private var marketRow: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeS) {
            Text("Market")
                .font(.headline)

            TextField("Market", text: .constant("REWE"))
        }
    }

    init(product: OFFProduct? = nil) {
        self.product = product
        self.name = product?.productName ?? ""
        self.amount = ""
        self.measureUnit = .gram
        self.category = .bakery
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
