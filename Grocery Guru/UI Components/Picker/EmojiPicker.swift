import SwiftUI

struct EmojiPicker: View {
    var selection: (String) -> Void

    let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: columns) {
                ForEach(Assets.emojis, id: \.self) { emoji in
                    Button("\(emoji)") {
                        selection(emoji)
                    }
                    .accessibilityIdentifier(AccessibilityIdentifier.ListElement.emoji)
                }
            }
        }
        .scrollIndicators(.hidden)
    }

    init(selection: @escaping (String) -> Void) {
        self.selection = selection
    }
}

#Preview {
    EmojiPicker { _ in }
}
