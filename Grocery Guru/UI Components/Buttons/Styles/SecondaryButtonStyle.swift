import SwiftUI

struct SecondaryButtonStyle: PrimitiveButtonStyle {
    private let height: CGFloat?

    init(height: CGFloat? = nil) {
        self.height = height
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(Constants.Padding.sizeL)
            .frame(maxHeight: height)
            .background(Color(.secondarySystemBackground))
            .clipShape(.rect(cornerRadius: Constants.Radius.Normal))
    }
}

extension PrimitiveButtonStyle where Self == SecondaryButtonStyle {
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
