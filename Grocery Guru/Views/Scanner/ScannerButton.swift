import SwiftUI

struct ScannerButton: View {

    let action: () -> ()

    var body: some View {
        Button {
            action()
        } label: {

            Image(systemName: "doc.viewfinder")
                .font(.largeTitle)
                .foregroundStyle(.labelPrimary)
                .padding(Constants.Padding.L)
                .background {
                    Circle()
                        .fill(.accent.opacity(0.75))
                }
        }
    }
}

#Preview {
    ScannerButton {
        print("Preview Button Test")
    }
}
