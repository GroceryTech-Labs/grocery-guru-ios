import SwiftUI
import SwiftData
import DesignSystem

public struct CategoryCardList: View {
    @Environment(\.dynamicTypeSize)
    private var typeSize

    @Query private var customCategories: [CustomCategory]

    private var columns: [GridItem] {
        if typeSize.isAccessibilitySize {
            return [GridItem(.flexible())]
        }

        return [GridItem(.flexible()), GridItem(.flexible())]
    }

    private var categories: [BaseCategory] {
        BaseCategory.allCases + customCategories.map { category in
            BaseCategory.custom(
                name: category.name,
                emoji: category.emoji
            )
        }
    }

    private let onCardTaped: () -> Void

    public var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                spacing: Constants.Padding.sizeS
            ) {
                ForEach(categories, id: \.hashValue) { category in
                    CategoryCard(category: category) {
                        onCardTaped()
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }

    public init(onCardTaped: @escaping () -> Void) {
        self.onCardTaped = onCardTaped
    }
}

#Preview {
    ScrollView {
        CategoryCardList { }
    }
}
