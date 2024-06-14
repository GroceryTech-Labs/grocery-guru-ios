//
//  InvoiceCategoryPicker.swift
//  Grocery Guru
//
//  Created by Max Maetze on 15.06.24.
//

import SwiftUI

struct InvoiceCategoryPicker: View {
    @Binding var selection: InvoiceItemCategory

    @State private var rowHeight: CGFloat = .zero

    let array = InvoiceItemCategory.allCases

    var body: some View {
        HStack {
            ScrollView(.horizontal) {
                ScrollViewReader { reader in
                    HStack(spacing: Constants.Padding.sizeS) {
                        ForEach(Array(array.enumerated()), id: \.offset) { category in
                            HStack(spacing: Constants.Padding.sizeS) {
                                category.element.emoji.text

                                if selection == category.element {
                                    Text(category.element.localized)
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
                            .background(backgroundView(category: category.element))
                            .clipShape(.rect(cornerRadius: Constants.Radius.Normal))
                            .background {
                                GeometryReader { gReader in
                                    Color.clear
                                        .onAppear {
                                            rowHeight = gReader.size.height
                                        }
                                }
                            }
                            .onTapGesture {
                                selection = category.element

                                withAnimation {
                                    reader.scrollTo(category.offset, anchor: .leading)
                                }
                            }
                            .accessibilityElement()
                            .accessibilityAddTraits(.isButton)
                            .accessibilityIdentifier(
                                AccessibilityIdentifier.Button.invoiceCategory
                            )
                            .animation(.smooth, value: selection)
                        }
                    }
                }
            }
            .scrollIndicators(.hidden)

            Image(systemName: "ellipsis")
                .padding(Constants.Padding.sizeL)
                .frame(maxHeight: rowHeight)
                .background(Color(.secondarySystemBackground))
                .clipShape(.rect(cornerRadius: Constants.Radius.Normal))
                .onTapGesture {
                }
                .accessibilityElement()
                .accessibilityAddTraits(.isButton)
        }
    }

    func backgroundView(category: InvoiceItemCategory) -> Color {
        selection == category ? .accentColor : Color(.secondarySystemBackground)
    }
}

#Preview {
    InvoiceCategoryPicker(selection: .constant(.fish))
}
