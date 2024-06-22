import SwiftUI

struct SecondaryButtonStyle: ButtonStyle {
    private let height: CGFloat?

    init(height: CGFloat? = nil) {
        self.height = height
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(Constants.Padding.sizeL)
            .background(Color(.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: Constants.Radius.Normal))
            .shadow(radius: 1, y: 1)
            .padding(Constants.Padding.sizeS)
    }
}

extension ButtonStyle where Self == SecondaryButtonStyle {
    static var secondary: SecondaryButtonStyle {
        SecondaryButtonStyle()
    }

    static func secondary(height: CGFloat?) -> SecondaryButtonStyle {
        SecondaryButtonStyle(height: height)
    }
}

#Preview {
    Button(InvoiceItemCategory.bakery.localized) { }
        .buttonStyle(.secondary)
}
