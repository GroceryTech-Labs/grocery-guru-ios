import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var viewModel: HomeViewModel

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            HomeViewList(viewModel: viewModel)
                .fullScreenCover(isPresented: $viewModel.shouldShowDocScan) {
                    ScannerView { scanStrings in
                        viewModel.addItemsFromScanStrings(scanStrings)
                    }
                    .ignoresSafeArea(.all)
                }
            //                .sheet(isPresented: $viewModel.shouldShowAddSheet) {
            //                    AddInvoiceItemView(
            //                        isShown: $viewModel.shouldShowAddSheet,
            //                        itemRepository: viewModel.repository
            //                    ) {
            //                        viewModel.fetchItems()
            //                    }
        }
        .task {
            viewModel.fetchItems()
        }
    }
}

extension HomeView {
    private struct HomeViewList: View {
        @State var viewModel: HomeViewModel

        private var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .full
            return formatter
        }

        var body: some View {
            ScrollView {
                VStack(spacing: Constants.Padding.L) {
                    Text("Welcome back!")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)

                    VStack(spacing: Constants.Padding.S) {
                        Text("Last shopping trips")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ForEach(0..<3) { num in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(dateFormatter.string(from: .now))
                                    Text("@ items")
                                        .font(.caption)
                                }

                                Spacer()

                                Button {

                                } label: {
                                    Image(systemName: "chevron.right")
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(Constants.Padding.M)
                            .background(Color(.secondary))
                            .clipShape(.rect(cornerRadius: Constants.Padding.S))
                            .shadow(radius: 1, y: 1)
                        }
                    }

                    VStack(spacing: Constants.Padding.S) {
                        Text("Categories")
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        LazyVGrid(
                            columns: [GridItem(.flexible()), GridItem(.flexible())],
                            spacing: Constants.Padding.M
                        ) {
                            ForEach(InvoiceItemCategory.allCases) { category in
                                InvoiceCategoryCard(
                                    category: category,
                                    items: viewModel.items
                                )
                            }
                        }
                    }
                }
            }
            .padding(Constants.Padding.L)
            .background(Color(.primary), ignoresSafeAreaEdges: .all)
            .foregroundStyle(Color(.labelPrimary))
        }
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(
            repository: MockItemRepository.preview
        )
    )
}
