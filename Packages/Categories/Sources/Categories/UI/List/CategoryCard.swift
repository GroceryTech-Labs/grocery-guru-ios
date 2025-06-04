import SwiftUI
import DesignSystem
import Routing

public struct CategoryCard: View {
    @Environment(\.navigationService)
    private var navigator

    @Binding private var category: UICategoryItem

    private let isPreview: Bool
    private let emojiSize: CGFloat = 64

    public var body: some View {
        ResponsiveCard {
            VStack(spacing: Constants.Padding.sizeM) {
                Text(category.emoji)
                    .font(.system(size: emojiSize))

                VStack(spacing: Constants.Padding.sizeS) {
                    Text(category.categoryName)
                    Text("\(category.invoiceCount) Invoices".localized)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .onTapGesture {
            navigator.push(.invoiceList(categoryId: category.id))
        }
        .accessibilityAddTraits(.isButton)
        .buttonStyle(.plain)
        .accessibilityIdentifier(AccessibilityIdentifier.Button.invoiceCategory)
        .accessibilityLabel("Category Card".localized)
    }

    public init(category: Binding<UICategoryItem>, isPreview: Bool = false) {
        self._category = category
        self.isPreview = isPreview
    }
}
