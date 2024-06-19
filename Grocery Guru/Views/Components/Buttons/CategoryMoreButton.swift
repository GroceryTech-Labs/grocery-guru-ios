import SwiftUI

struct CategoryMoreButton: View {
    let height: CGFloat?

    let action: Void

    var body: some View {
        Button {
            action
        } label: {
            Image(systemName: "ellipsis")
        }
        .accessibilityLabel("Show more")
        .buttonStyle(.secondary(height: height))
    }

    init(height: CGFloat? = nil, action: @escaping () -> Void) {
        self.height = height
        self.action = action()
    }
}

#Preview {
    CategoryMoreButton { }
}
