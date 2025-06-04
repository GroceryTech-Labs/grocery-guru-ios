import SwiftUI
import OpenFoodFacts
import DesignSystem
import Categories

public struct InvoiceForm: View {
    enum Field: Hashable {
        case name
        case quantity
        case unit
    }

    @State private var viewModel: InvoiceFormViewModel
    @FocusState private var focusedField: Field?

    public var body: some View {
        ScrollView {
            SectionHeader("Add Item".localized) {
                VStack(spacing: Constants.Padding.sizeXL) {
                    NameRow(name: $viewModel.name)
                        .focused($focusedField, equals: .name)
                        .submitLabel(.next)
                        .onSubmit {
                            focusedField = .quantity
                        }

                    QuantityRow(
                        focusedField: _focusedField,
                        quantity: $viewModel.quantity,
                        unit: $viewModel.unit
                    )

                    CategoryPickerRow(
                        selectedCategory: $viewModel.category,
                        categoryRepository: viewModel.categoryRepository
                    )

                    if let code = viewModel.code {
                        NutrimentsRow(
                            productAPI: viewModel.productAPI,
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
        .onAppear {
            Task {
                await viewModel.fetchProductInformation()
            }
        }
    }

    public init(
        categoryRepository: CategoryRepository,
        invoiceRepository: InvoiceRepository,
        productAPI: ProductAPI,
        code: String? = nil
    ) {
        viewModel = InvoiceFormViewModel(
            categoryRepository: categoryRepository,
            invoiceRepository: invoiceRepository,
            productAPI: productAPI,
            code: code
        )
    }
}
