import SwiftUI
import DesignSystem

struct PrimaryButtonStyle: ButtonStyle {
    private let height: CGFloat?

    init(height: CGFloat? = nil) {
        self.height = height
    }

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(Constants.Padding.sizeL)
            .background(Color(.tintColor))
            .clipShape(.rect(cornerRadius: Constants.Radius.Normal))
            .shadow(radius: 1, x: 1, y: 1)
            .padding(Constants.Padding.sizeS)
    }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
    static var primary: PrimaryButtonStyle {
        PrimaryButtonStyle()
    }

    static func primary(height: CGFloat?) -> PrimaryButtonStyle {
        PrimaryButtonStyle(height: height)
    }
}

#Preview {
    Button(InvoiceItemCategory.bakery.localized) { }
        .buttonStyle(.primary)
}
