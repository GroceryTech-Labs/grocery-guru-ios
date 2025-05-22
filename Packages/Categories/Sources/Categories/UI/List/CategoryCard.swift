import SwiftUI
import DesignSystem

public struct CategoryCard: View {
    private var onTapAction: (() -> Void)?

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
            if let onTapAction {
                onTapAction()
            }
        }
        .accessibilityAddTraits(.isButton)
        .buttonStyle(.plain)
        .accessibilityIdentifier(AccessibilityIdentifier.Button.invoiceCategory)
        .accessibilityLabel("Category Card")
    }

    public init(category: UICategoryItem, isPreview: Bool = false, onTapAction: (() -> Void)? = nil) {
        self.onTapAction = onTapAction
        self.category = category
        self.isPreview = isPreview
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    CategoryCard(category: UICategoryItem(categoryName: "Egg", emoji: "🥚")) {

    }
    .padding()
}
