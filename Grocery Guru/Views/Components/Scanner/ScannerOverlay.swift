import SwiftUI

struct ScannerOverlay: View {
    @Binding var isPresented: Bool
    let systemImage: String

    private let opacity = 0.5

    var body: some View {
        if isPresented {
            Image(systemName: systemImage)
                .resizable()
                .scaledToFit()
                .foregroundStyle(.white.opacity(opacity))
                .padding(Constants.Padding.sizeXXL)
                .accessibilityHidden(true)
                .onAppear {
                    hideCodeIndicator()
                }
        }
    }

    func hideCodeIndicator() {
        let delay = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            withAnimation {
                isPresented = false
            }
        }
    }
}

#Preview {
    ScannerOverlay(
        isPresented: .constant(true),
        systemImage: "doc.viewfinder"
    )
}
