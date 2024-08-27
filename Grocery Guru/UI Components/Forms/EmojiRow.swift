import SwiftUI

struct EmojiRow: View {
    var selection: (String) -> Void

    var body: some View {
        SectionHeader("Emoji", font: .headline) {
            EmojiPicker { emoji in
                selection(emoji)
            }
        }
    }

    init(selection: @escaping (String) -> Void) {
        self.selection = selection
    }
}

#Preview {
    EmojiRow { _ in }
}
