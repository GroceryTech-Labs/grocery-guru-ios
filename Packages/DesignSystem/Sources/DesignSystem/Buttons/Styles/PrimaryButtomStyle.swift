import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    private let height: CGFloat?

    public init(height: CGFloat? = nil) {
        self.height = height
    }

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(Constants.Padding.sizeL)
            .foregroundStyle(.white)
            .background(Color(.tintColor))
            .clipShape(.rect(cornerRadius: Constants.Radius.Normal))
            .shadow(radius: 1, x: 1, y: 1)
            .padding(Constants.Padding.sizeS)
    }
}

extension ButtonStyle where Self == PrimaryButtonStyle {
    public static var primary: PrimaryButtonStyle {
        PrimaryButtonStyle()
    }

    public static func primary(height: CGFloat?) -> PrimaryButtonStyle {
        PrimaryButtonStyle(height: height)
    }
}

#Preview {
    Button {
        print("Test")
    } label: {
        Text(verbatim: "Test")
    }
    .buttonStyle(.primary)
}
