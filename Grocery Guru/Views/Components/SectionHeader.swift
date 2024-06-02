import SwiftUI

struct SectionHeader: View {
    private let text: LocalizedStringKey
    private let font: Font

    var body: some View {
        Text(text)
            .font(font)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.labelPrimary)
    }

    init(_ text: LocalizedStringKey, font: Font = .title) {
        self.text = text
        self.font = font
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SectionHeader("Categories")
}
