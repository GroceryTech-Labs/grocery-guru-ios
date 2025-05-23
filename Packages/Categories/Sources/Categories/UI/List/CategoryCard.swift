import SwiftUI
import DesignSystem
import Routing

public struct CategoryCard: View {
    @Environment(\.navigationService)
    private var navigator

    private let category: UICategoryItem
    private let isPreview: Bool
    private let emojiSize: CGFloat = 64

    public var body: some View {
        ResponsiveCard {
            VStack(spacing: Constants.Padding.sizeM) {
                Text(category.emoji)
                    .font(.system(size: emojiSize))

                Text(category.categoryName)
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .onTapGesture {
            navigator.push(.invoiceList)
        }
        .accessibilityAddTraits(.isButton)
        .buttonStyle(.plain)
        .accessibilityIdentifier(AccessibilityIdentifier.Button.invoiceCategory)
        .accessibilityLabel("Category Card")
    }

    public init(category: UICategoryItem, isPreview: Bool = false) {
        self.category = category
        self.isPreview = isPreview
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CategoryCard(
        category: UICategoryItem(
            categoryName: "Egg",
            emoji: "🥚"
        )
    )
    .padding()
}
