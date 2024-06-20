import SwiftUI

struct AddInvoiceButton: View {
    @Environment(\.navigationService)
    private var navigator

    var body: some View {
        Button {
            navigator.push(.addInvoice())
        } label: {
            Image(systemName: "plus")
                .font(.largeTitle)
                .padding(Constants.Padding.sizeL)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.circle)
        .accessibilityLabel("Add Invoice")
        .accessibilityIdentifier(AccessibilityIdentifier.Button.addInvoice)
    }
}

#Preview {
    AddInvoiceButton()
}
