import SwiftUI

struct SectionHeader<Content: View>: View {
    private let text: LocalizedStringKey
    private let font: Font
    private let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeM) {
            Text(text)
                .font(font)
                .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                )

            content
        }
    }

    init(
        _ text: LocalizedStringKey,
        font: Font = .title,
        @ViewBuilder _ content: () -> Content
    ) {
        self.text = text
        self.font = font
        self.content = content()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SectionHeader("Categories") {
        Text("332")
    }
}
