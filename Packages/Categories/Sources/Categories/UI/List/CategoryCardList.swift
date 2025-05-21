import SwiftUI
import DesignSystem

public struct CategoryCardList: View {
    @Environment(\.dynamicTypeSize)
    private var typeSize

    private var columns: [GridItem] {
        if typeSize.isAccessibilitySize {
            return [GridItem(.flexible())]
        }

        return [GridItem(.flexible()), GridItem(.flexible())]
    }

    @State private var viewModel = CategoryCardListViewModel()

    public var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                spacing: Constants.Padding.sizeS
            ) {
                ForEach(viewModel.categories, id: \.hashValue) { category in
                    CategoryCard(category: category) {
                        viewModel.navigateToCategoryDetails()
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .onAppear {
            Task {
                await viewModel.fetchCategories()
            }
        }
    }

    public init() { }
}

#Preview {
    ScrollView {
        CategoryCardList()
    }
}
