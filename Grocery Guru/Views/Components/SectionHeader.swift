import SwiftUI

struct SectionHeader: View {
    private let text: String
    private let font: Font

    var body: some View {
        Text(text)
            .font(font)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.labelPrimary)
    }

    init(_ text: String, font: Font = .title) {
        self.text = text
        self.font = font
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SectionHeader("Invoices")
}
