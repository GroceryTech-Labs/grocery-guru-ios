import SwiftUI

enum Emoji: String, CaseIterable {
    case fruit = "🍎"
    case vegetable = "🥕"
    case bakery = "🥖"
    case cheeseEggDiary = "🥛"
    case meat = "🥩"
    case fish = "🐟"
    case canned = "🥫"
    case gear = "⚙️"

    func text(size: CGFloat) -> Text {
        Text(self.rawValue)
            .font(.system(size: size))
    }
}

private struct EmojiPreview: View {
    var body: some View {
        VStack {
            ForEach(Emoji.allCases, id: \.hashValue) { emoji in
                emoji.text(size: 64)
            }
        }
    }
}

#Preview {
    EmojiPreview()
}
