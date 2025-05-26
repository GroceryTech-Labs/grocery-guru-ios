import SwiftUI
import DesignSystem
import Categories

@Observable
class InvoiceListViewModel: ObservableObject {
    private let invoiceRepository: InvoiceRepository
    private let categoryName: String?

    var error: Error?

    public init(invoiceRepository: InvoiceRepository, categoryName: String?) {
        self.invoiceRepository = invoiceRepository
        self.categoryName = categoryName
    }

    var invoices: [UIInvoiceItem] = []

    @MainActor
    func fetchInvoices() async {
        do {
            if let categoryName {
                invoices = try await invoiceRepository.fetchInvoicesByCategory(categoryName)
            } else {
                invoices = try await invoiceRepository.fetchInvoices()
            }
        } catch {
            self.error = error
        }
    }
}

public struct InvoiceList: View {
    @State private var viewModel: InvoiceListViewModel

    public var body: some View {
        SectionHeader("Invoice Items") {
            Group {
                if viewModel.invoices.isEmpty {
                    ErrorView(text: "No items found!")
                } else if let error = viewModel.error {
                    ErrorView(text: error.localizedDescription)
                } else {
                    ScrollView {
                        LazyVStack(spacing: Constants.Padding.sizeM) {
                            ForEach(viewModel.invoices) { invoice in
                                InvoiceItemListRow(item: invoice)
                            }
                        }
                        .padding(.horizontal, Constants.Padding.sizeX)
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal, Constants.Padding.sizeL)
        .onAppear {
            Task {
                await viewModel.fetchInvoices()
            }
        }
    }

    public init(invoiceRepository: InvoiceRepository, categoryName: String?) {
        self.viewModel = InvoiceListViewModel(
            invoiceRepository: invoiceRepository,
            categoryName: categoryName
        )
    }
}
