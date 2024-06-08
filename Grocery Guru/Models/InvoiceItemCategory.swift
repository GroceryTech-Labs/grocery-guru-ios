import SwiftUI

enum InvoiceItemCategory: Codable, CaseIterable, Hashable {
    case bakery
    case canned
    case fish
    case fruits
    case meat
    case milkEgg
    case vegetables

    struct Picker: View {
        @Binding var selection: InvoiceItemCategory

        var body: some View {
            ScrollView(.horizontal) {
                HStack(spacing: Constants.Padding.sizeS) {
                    ForEach(InvoiceItemCategory.allCases, id: \.hashValue) { category in
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
                        .onTapGesture {
                            selection = category
                        }
                        .accessibilityAddTraits(.isButton)
                        .animation(.smooth, value: selection)
                    }
                }
            }
        }

        func backgroundView(category: InvoiceItemCategory) -> Color {
            selection == category ? Color.accentColor : Color.surfaceSecondary
        }
    }

    var localized: LocalizedStringKey {
        switch self {
        case .bakery:
            "Bakery"
        case .canned:
            "Canned"
        case .fish:
            "Fish"
        case .fruits:
            "Fruits"
        case .meat:
            "Meat"
        case .milkEgg:
            "Milk & Egg"
        case .vegetables:
            "Vegetables"
        }
    }

    // swiftlint:disable indentation_width

    var emoji: Emoji {
        switch self {
        case .bakery:
                .bakery

        case .canned:
                .canned

        case .fish:
                .fish

        case .fruits:
                .fruit

        case .meat:
                .meat

        case .milkEgg:
                .milkEgg

        case .vegetables:
                .vegetable
        }
    }

    // swiftlint:enable indentation_width
}
