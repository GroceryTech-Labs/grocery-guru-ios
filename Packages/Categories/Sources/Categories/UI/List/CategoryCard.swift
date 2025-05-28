import SwiftUI
import DesignSystem
import Routing

public struct CategoryCard: View {
    @Environment(\.navigationService)
    private var navigator

    private let category: UICategoryItem

    private var invoiceCount: Int {
        category.invoiceCount
    }

    private let isPreview: Bool
    private let emojiSize: CGFloat = 64

    public var body: some View {
        ResponsiveCard {
            VStack(spacing: Constants.Padding.sizeM) {
                Text(category.emoji)
                    .font(.system(size: emojiSize))

                VStack(spacing: Constants.Padding.sizeS) {
                    Text(category.categoryName)
                    Text(
                        "\(invoiceCount) Invoices",
                        bundle: .module
                    )
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .onTapGesture {
            navigator.push(.invoiceList(categoryName: category.categoryName))
        }
        .accessibilityAddTraits(.isButton)
        .buttonStyle(.plain)
        .accessibilityIdentifier(AccessibilityIdentifier.Button.invoiceCategory)
        .accessibilityLabel(
            String(
                localized: "Category Card",
                bundle: .module
            )
        )
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
