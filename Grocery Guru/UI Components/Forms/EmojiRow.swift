import SwiftUI

struct EmojiRow: View {
    var selection: (String) -> Void

    private let pickerHeight: CGFloat = 200
    private let emojiSize: CGFloat = 64

    var body: some View {
        SectionHeader("Emoji", font: .headline) {
            
        }
        .frame(maxHeight: pickerHeight)
    }

    init(selection: @escaping (String) -> Void) {
        self.selection = selection
    }
}

#Preview {
    EmojiRow { _ in }
}
