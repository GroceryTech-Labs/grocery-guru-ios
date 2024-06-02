import SwiftUI

enum Emoji: String, CaseIterable {
    case fruit = "🍎"
    case vegetable = "🥕"
    case bakery = "🥖"
    case milkEgg = "🥛"
    case meat = "🥩"
    case fish = "🐟"
    case canned = "🥫"
    case gear = "⚙️"

    var text: Text {
        Text(self.rawValue)
    }
}

private struct EmojiPreview: View {
    var body: some View {
        VStack {
            ForEach(Emoji.allCases, id: \.hashValue) { emoji in
                emoji.text
                    .font(.system(size: 64))
            }
        }
    }
}

#Preview {
    EmojiPreview()
}
