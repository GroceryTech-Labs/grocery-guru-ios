import SwiftUI
import DesignSystem

struct EmojiRow: View {
    @Binding var selection: String

    private let pickerHeight: CGFloat = 200
    private let emojiSize: CGFloat = 64

    var body: some View {
        SectionHeader("Emoji", font: .headline) {
            EmojiTextFieldWrapper(text: $selection)
        }
        .frame(maxHeight: pickerHeight)
    }

    init(selection: Binding<String>) {
        self._selection = selection
    }
}

#Preview {
    @Previewable @State var selection: String = ""
    EmojiRow(selection: $selection)
}
