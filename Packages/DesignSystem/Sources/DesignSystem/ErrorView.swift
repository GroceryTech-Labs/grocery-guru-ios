import SwiftUI

public struct ErrorView: View {
    private let text: LocalizedStringKey

    public var body: some View {
        Text(text)
            .font(.title)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .padding(Constants.Padding.sizeL)
    }

    public init(text: LocalizedStringKey) {
        self.text = text
    }
}

#Preview {
    ErrorView(text: "No items found!")
}
