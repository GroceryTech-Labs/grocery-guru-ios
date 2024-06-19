import SwiftUI

struct InvoiceCategoryPicker: View {
    @Binding var selection: InvoiceItemCategory

    @State private var rowHeight: CGFloat = .zero

    private var categories: EnumeratedSequence<[InvoiceItemCategory]>.Iterator {
        InvoiceItemCategory.allCases.enumerated().makeIterator()
    }

    private let scrollX: CGFloat = 0.1
    private var scrollAnchor: UnitPoint {
        UnitPoint(
            x: scrollX,
            y: 0
        )
    }

    var body: some View {
        HStack(spacing: Constants.Padding.sizeS) {
            ScrollView(.horizontal) {
                ScrollViewReader { sReader in
                    HStack(spacing: Constants.Padding.sizeS) {
                        ForEach(Array(categories), id: \.offset) { category in
                            Button {
                                withAnimation(.smooth) {
                                    selection = category.element
                                    sReader.scrollTo(
                                        category.offset,
                                        anchor: scrollAnchor
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

            CategoryMoreButton(height: rowHeight) {
                // TODO: Open sheet
            }
        }
    }

    func buttonLabel(category: InvoiceItemCategory) -> some View {
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
        .padding(Constants.Padding.sizeL)
        .background(backgroundView(category: category))
        .clipShape(.rect(cornerRadius: Constants.Radius.Normal))
        .background {
            GeometryReader { gReader in
                Color.clear
                    .onAppear {
                        rowHeight = gReader.size.height
                    }
            }
        }
    }

    func backgroundView(category: InvoiceItemCategory) -> Color {
        selection == category ? .accentColor : Color(.secondarySystemBackground)
    }
}

// swiftlint:disable one_declaration_per_file

private struct Picker_Preview: View {
    @State private var category = InvoiceItemCategory.bakery

    var body: some View {
        InvoiceCategoryPicker(selection: $category)
    }
}

// swiftlint:enable one_declaration_per_file

#Preview {
    Picker_Preview()
}
