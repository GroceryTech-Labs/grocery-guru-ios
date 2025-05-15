import SwiftUI
import DesignSystem

struct ErrorToast: View {
    @Binding var error: Error?
    var displayTime: TimeInterval = 3.0

    var body: some View {
        if let error {
            HStack {
                Image(systemName: "exclamationmark.triangle.fill")
                    .accessibilityHidden(true)

                Text(error.localizedDescription)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, Constants.Padding.sizeL)
            .padding(.vertical, Constants.Padding.sizeS)
            .background(Material.regular, in: .capsule)
            .foregroundStyle(.error)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + displayTime) {
                    withAnimation {
                        self.error = nil
                    }
                }
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ErrorToast(
        error: .constant(
            OFFError.productNotFound(
                "product not found"
            )
        )
    )
    .padding()
}
