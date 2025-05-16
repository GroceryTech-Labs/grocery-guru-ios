import SwiftUI

public struct SectionHeader<Content: View, Trailing: View>: View {
    private let text: LocalizedStringKey
    private let font: Font
    private let content: Content
    private let trailing: Trailing?

    public var body: some View {
        VStack(alignment: .leading, spacing: Constants.Padding.sizeM) {
            HStack {
                Text(text)
                    .font(font)
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )

                Spacer()

                if let trailing {
                    trailing
                }
            }

            content
        }
    }

    public init(
        _ text: LocalizedStringKey,
        font: Font = .title,
        @ViewBuilder _ content: () -> Content,
        @ViewBuilder trailing: () -> Trailing? = { EmptyView() }
    ) {
        self.text = text
        self.font = font
        self.content = content()
        self.trailing = trailing()
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    SectionHeader("Categories") {
        Text(verbatim: "332")
    } trailing: {
        Button {
            print("Test")
        } label: {
            Text(verbatim: "Test")
        }
    }
}
