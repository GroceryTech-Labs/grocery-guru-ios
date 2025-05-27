import SwiftUI

@MainActor
@Observable
final class NutrimentsViewModel {
    private let productAPI: ProductAPI
    private let code: String

    var nutriments: UINutrimentsItem?

    init(productAPI: ProductAPI, code: String) {
        self.productAPI = productAPI
        self.code = code

        Task {
            await fetchNutriments()
        }
    }

    @MainActor
    func fetchNutriments() async {
        do {
            let result = try await productAPI.fetchProduct(barcode: code, fields: [.nutriments])
            nutriments = UINutrimentsItem(from: result.nutriments)
        } catch {
            print(error.localizedDescription)
        }
    }
}
