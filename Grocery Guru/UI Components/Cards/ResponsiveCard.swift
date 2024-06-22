import SwiftUI

struct ResponsiveCard<Content: View>: View {
    private let alignment: Alignment
    private let background: Color
    private let content: Content

    var body: some View {
        content
            .frame(maxWidth: .infinity, alignment: alignment)
            .padding(Constants.Padding.sizeL)
            .background(background)
            .clipShape(.rect(cornerRadius: Constants.Radius.Normal))
            .shadow(radius: 1, y: 1)
            .padding(Constants.Padding.sizeX)
    }

    init(
        alignment: Alignment = .center,
        background: Color = Color(.secondarySystemBackground),
        @ViewBuilder _ content: () -> Content
    ) {
        self.alignment = alignment
        self.background = background
        self.content = content()
    }
}

#Preview {
    ResponsiveCard {
        Text("Hello World!")
    }
}
