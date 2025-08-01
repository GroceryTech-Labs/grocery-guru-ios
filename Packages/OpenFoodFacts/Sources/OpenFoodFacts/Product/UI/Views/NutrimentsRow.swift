import SwiftUI
import DesignSystem

public struct NutrimentsRow: View {
    private let productAPI: ProductAPI
    private let code: String

    public var body: some View {
        SectionHeader("Nutriments (100g)", font: .headline) {
            NutrimentsView(
                productAPI: productAPI,
                code: code
            )
        }
    }

    public init(productAPI: ProductAPI, code: String) {
        self.productAPI = productAPI
        self.code = code
    }
}
