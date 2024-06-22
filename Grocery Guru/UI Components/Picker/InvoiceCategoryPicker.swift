import SwiftUI

struct InvoiceCategoryPicker: View {
    @Binding var selection: InvoiceItemCategory

    private var categories: EnumeratedSequence<[InvoiceItemCategory]>.Iterator {
        InvoiceItemCategory.allCases.enumerated().makeIterator()
    }

    var body: some View {
        HStack(spacing: Constants.Padding.sizeS) {
            ScrollView(.horizontal) {
                ScrollViewReader { sReader in
                    HStack(spacing: 0) {
                        ForEach(Array(categories), id: \.offset) { category in
                            Button {
                                withAnimation(.smooth) {
                                    selection = category.element
                                    sReader.scrollTo(
                                        category.offset,
                                        anchor: .leading
                                    )
                                }
                            } label: {
                                buttonLabel(category: category.element)
                            }
                            .buttonStyle(.plain)

                            .accessibilityIdentifier(
                                AccessibilityIdentifier.Button.invoiceCategory
                            )
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollClipDisabled(true)
        }
    }

    func buttonLabel(category: InvoiceItemCategory) -> some View {
        let background = selection == category ? .accentColor : Color(.secondarySystemBackground)
        return ResponsiveCard(background: background) {
            HStack(spacing: Constants.Padding.sizeS) {
                category.emoji.text

                if selection == category {
                    Text(category.localized)
                        .lineLimit(1)
                        .transition(
                            .asymmetric(
                                insertion: .push(from: .trailing),
                                removal: .offset(x: 100)
                            )
                        )
                }
            }
        }
    }
}

#Preview {
    InvoiceCategoryPicker(selection: .constant(.bakery))
}
