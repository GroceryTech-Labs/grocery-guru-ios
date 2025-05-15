import SwiftUI
import OpenFoodFacts

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

    static var nutriments: APINutrimentsItem? {
        guard let asset = NSDataAsset(name: "nutriments") else {
            return nil
        }

        let data = asset.data
        let decoder = JSONDecoder()

        guard let nutrimentsData = try? decoder.decode(APINutrimentsItem.self, from: data) else {
            return nil
        }

        return nutrimentsData
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
