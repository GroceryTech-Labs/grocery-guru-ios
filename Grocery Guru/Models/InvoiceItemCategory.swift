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

        let columnAmount = 5

        var body: some View {
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible()), count: columnAmount),
                spacing: Constants.Padding.sizeS
            ) {
                ForEach(InvoiceItemCategory.allCases, id: \.hashValue) { category in
                    category.emoji.text
                        .padding(Constants.Padding.sizeL)
                        .background(
                            selection == category ? Color.accentColor : Color.surfaceSecondary,
                            in: .circle,
                            fillStyle: .init()
                        )
                        .onTapGesture {
                            selection = category
                        }
                        .accessibilityAddTraits(.isButton)
                }
            }
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
}
