import SwiftUI

enum Assets {
    static var emojis: [String] {
        guard let asset = NSDataAsset(name: "emojis") else {
            return []
        }

        let data = asset.data
        let decoder = JSONDecoder()

        guard let emojiData = try? decoder.decode(EmojiData.self, from: data) else {
            return []
        }

        return emojiData.emojis
    }
}

#Preview {
    ScrollView {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]) {
            ForEach(Assets.emojis, id: \.self) { emoji in
                Text(emoji)
            }
        }
    }
    .scrollIndicators(.hidden)
}
