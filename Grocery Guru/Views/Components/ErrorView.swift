import SwiftUI

struct ErrorView: View {
    private let text: LocalizedStringKey

    var body: some View {
        Text(text)
            .font(.title)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .padding(Constants.Padding.sizeL)
    }

    init(text: LocalizedStringKey) {
        self.text = text
    }
}

#Preview {
    ErrorView(text: "No items found!")
}
