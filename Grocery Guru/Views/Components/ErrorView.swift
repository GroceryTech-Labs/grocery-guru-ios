import SwiftUI

struct ErrorView: View {
    private let text: LocalizedStringKey

    var body: some View {
        Text(text)
            .font(.title)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .foregroundStyle(.labelPrimary)
            .padding(Constants.Padding.sizeL)
            .background(Color.surfacePrimary, ignoresSafeAreaEdges: .all)
    }

    init(text: LocalizedStringKey) {
        self.text = text
    }
}

#Preview {
    ErrorView(text: "No items found!")
}
