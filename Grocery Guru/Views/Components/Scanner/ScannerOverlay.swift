import SwiftUI

struct ScannerOverlay: View {
    @Binding var isPresented: Bool
    let systemImage: String
    let color: Color

    var body: some View {
        if isPresented {
            Image(systemName: systemImage)
                .resizable()
                .scaledToFit()
                .foregroundStyle(color)
                .padding(Constants.Padding.sizeL)
                .accessibilityHidden(true)
                .onAppear {
                    hideCodeIndicator()
                }
        }
    }

    init(isPresented: Binding<Bool>, systemImage: String, color: Color = .white.opacity(0.5)) {
        self._isPresented = isPresented
        self.systemImage = systemImage
        self.color = color
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
