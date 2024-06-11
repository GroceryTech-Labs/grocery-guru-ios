import SwiftUI

struct AddInvoiceButton: View {
    private let opacity: CGFloat
    private let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "plus")
                .accessibilityLabel("Add Invoice")
                .font(.largeTitle)
                .padding(Constants.Padding.sizeL)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.circle)
        .accessibilityIdentifier(AccessibilityIdentifier.Button.addInvoice)
    }

    init(
        opacity: CGFloat = 0.75,
        action: @escaping () -> Void
    ) {
        self.opacity = opacity
        self.action = action
    }
}

#Preview {
    AddInvoiceButton {
        print("Preview Button Test")
    }
}
