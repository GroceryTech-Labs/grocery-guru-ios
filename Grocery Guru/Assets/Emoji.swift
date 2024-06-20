import SwiftUI

enum Emoji: String, Codable, CaseIterable {
    case bakery = "🥖"
    case canned = "🥫"
    case fish = "🐟"
    case fruit = "🍎"
    case gear = "⚙️"
    case meat = "🥩"
    case milkEgg = "🥛"
    case vegetable = "🥕"

    var text: Text {
        Text(self.rawValue)
    }
}

// swiftlint:disable no_magic_numbers

#Preview {
    ScrollView {
        ForEach(Emoji.allCases, id: \.hashValue) { emoji in
            emoji.text
                .font(.system(size: 64))
        }
    }
}

// swiftlint:enable no_magic_numbers
