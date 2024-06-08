import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var viewModel: HomeViewModel
    @Environment(\.navigationService)
    private var navigator

    var body: some View {
        HomeViewList(viewModel: viewModel)
            .overlay(alignment: .bottom) {
                AddInvoiceButton {
                    navigator.push(.addInvoice())
                }
            }
            .modelContext(viewModel.repository.modelContext)
            .onAppear {
                APIService.shared.fetchItem(
                    OFFProductResult.self,
                    url: URL(string: OFFAPIConfig.shared.stagingURL + "/api/v2/product/4066600603405?fields=product_name,nutriscore_data,nutriments,nutrition_grade")!,
                    method: .get) { result in
                        switch result {
                        case .success(let success):
                            print(success)

                        case .failure(let failure):
                            print(failure.localizedDescription)
                        }
                    }
            }
    }

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    HomeView(
        viewModel: HomeViewModel(repository: LocalStorageItemRepository.shared)
    )
}
