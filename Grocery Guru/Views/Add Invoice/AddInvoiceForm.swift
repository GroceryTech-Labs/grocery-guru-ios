import SwiftUI

struct AddInvoiceForm: View {
    enum Field: Hashable {
        case amount
        case name
        case market
    }

    @State private var name = ""
    @State private var amount = ""
    @State private var measureUnit: MeasureUnit = .gram
    @State private var category: InvoiceItemCategory = .bakery
    @FocusState private var focusedField: Field?

    @Environment(\.dismiss)
    private var dismiss

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
                .tint(.labelPrimary)
                .colorMultiply(.surfaceSecondary)
                .textFieldStyle(.roundedBorder)

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
        .background(Color.surfacePrimary, ignoresSafeAreaEdges: .all)
        .foregroundStyle(.labelPrimary)
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
                    try await LocalStorageItemRepository.shared.addItem(
                        InvoiceItem(
                            name: name,
                            amount: Int(amount) ?? 0,
                            category: category,
                            measureUnit: measureUnit
                        )
                    )
                    dismiss.callAsFunction()
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
}

#Preview {
    AddInvoiceForm()
}
