import SwiftUI

public struct ResponsiveCard<Content: View>: View {
    private let background: Color
    private let content: Content

    public var body: some View {
        content
            .padding(Constants.Padding.sizeL)
            .background(background)
            .clipShape(.rect(cornerRadius: Constants.Radius.Normal))
            .shadow(radius: 1, y: 1)
            .padding(Constants.Padding.sizeX)
    }

    public init(
        background: Color = Color(.secondarySystemBackground),
        @ViewBuilder _ content: () -> Content
    ) {
        self.background = background
        self.content = content()
    }
}

#Preview {
    ResponsiveCard {
        Text("Hello World!")
    }
}
