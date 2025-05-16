import SwiftUI

public struct ShowAddInvoiceButton: View {
    private let navigationAction: () -> Void

    public var body: some View {
        Button {
            navigationAction()
        } label: {
            Image(systemName: "plus")
                .font(.largeTitle)
        }
        .buttonStyle(.primary)
        .accessibilityLabel("Add Invoice")
        .accessibilityIdentifier(AccessibilityIdentifier.Button.addInvoice)
    }

    public init(navigationAction: @escaping () -> Void) {
        self.navigationAction = navigationAction
    }
}

#Preview {
    ShowAddInvoiceButton { }
}
