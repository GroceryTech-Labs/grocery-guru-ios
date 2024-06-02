import SwiftUI

struct ScannerButton: View {
    private let opacity: CGFloat
    private let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "doc.viewfinder")
                .accessibilityLabel("Document Scan")
                .font(.largeTitle)
                .foregroundStyle(.labelPrimary)
                .padding(Constants.Padding.sizeL)
                .background {
                    Circle()
                        .fill(.accent.opacity(opacity))
                }
        }
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
    ScannerButton {
        print("Preview Button Test")
    }
}
