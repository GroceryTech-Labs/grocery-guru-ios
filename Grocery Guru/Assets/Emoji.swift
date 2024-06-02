import SwiftUI

enum Emoji: String, CaseIterable {
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
