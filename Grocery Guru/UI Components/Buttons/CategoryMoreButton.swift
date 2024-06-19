import SwiftUI

struct CategoryMoreButton: View {
    private let height: CGFloat?
    private let action: Void

    var body: some View {
        Button {
            action
        } label: {
            Image(systemName: "ellipsis")
        }
        .buttonStyle(.secondary(height: height))
        .accessibilityLabel("Show more")
    }

    init(height: CGFloat? = nil, action: @escaping () -> Void) {
        self.height = height
        self.action = action()
    }
}

#Preview {
    CategoryMoreButton { }
}
