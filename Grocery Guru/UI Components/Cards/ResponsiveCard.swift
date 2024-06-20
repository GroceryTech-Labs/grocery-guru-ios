import SwiftUI

struct ResponsiveCard<Content: View>: View {
    let alignment: Alignment
    let content: Content

    var body: some View {
        content
            .frame(maxWidth: .infinity, alignment: alignment)
            .padding(Constants.Padding.sizeL)
            .background(Color(.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: Constants.Radius.Normal))
            .shadow(radius: 1, y: 1)
    }

    init(
        alignment: Alignment = .center,
        @ViewBuilder _ content: () -> Content
    ) {
        self.alignment = alignment
        self.content = content()
    }
}

#Preview {
    ResponsiveCard {
        Text("Hello World!")
    }
}
