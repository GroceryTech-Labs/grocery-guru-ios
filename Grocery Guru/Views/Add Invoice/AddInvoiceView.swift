import SwiftUI

struct AddInvoiceView: View {
    @State private var selectedOption: AddInvoiceOption

    var body: some View {
        VStack(spacing: Constants.Padding.sizeL) {
            Picker("Add Invoice Option", selection: $selectedOption) {
                ForEach(AddInvoiceOption.allCases, id: \.hashValue) { option in
                    Text(option.rawValue)
                        .tag(option)
                }
            }
            .pickerStyle(.segmented)
            .preferredColorScheme(.light)
            .padding(.horizontal, Constants.Padding.sizeL)

            switch selectedOption {
            case .manual:
                VStack(alignment: .leading, spacing: Constants.Padding.sizeL) {
                    SectionHeader("Add Item")
                    Group {
                        VStack(alignment: .leading, spacing: Constants.Padding.sizeX) {
                            Text("Name")
                                .font(.headline)

                            TextField("", text: .constant("Pringles"))
                        }

                        VStack(alignment: .leading, spacing: Constants.Padding.sizeX) {
                            Text("Amount")
                                .font(.headline)

                            TextField("", text: .constant("1,49"))
                        }

                        VStack(alignment: .leading, spacing: Constants.Padding.sizeX) {
                            Text("Measure Unit")
                                .font(.headline)

                            TextField("", text: .constant("Whole Item"))
                        }

                        VStack(alignment: .leading, spacing: Constants.Padding.sizeX) {
                            Text("Market")
                                .font(.headline)

                            TextField("", text: .constant("REWE"))
                        }
                    }
                    .tint(.labelPrimary)
                    .colorMultiply(.surfaceSecondary)

                    Spacer()

                    Button { } label: {
                        Text("Add Invoice Item")
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, Constants.Padding.sizeL)

            case .scan:
                ScannerView { _ in }
            }
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .top
        )
        .padding(.top, Constants.Padding.sizeL)
        .background(Color.surfacePrimary, ignoresSafeAreaEdges: .all)
        .foregroundStyle(.labelPrimary)
    }

    init(selectedOption: AddInvoiceOption = .scan) {
        self.selectedOption = selectedOption
    }
}

#Preview {
    AddInvoiceView(selectedOption: .manual)
}
