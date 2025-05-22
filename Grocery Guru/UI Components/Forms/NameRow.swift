import SwiftUI
import DesignSystem

struct NameRow: View {
    @Binding var name: String

    var body: some View {
        Text(name)
    }
}

#Preview {
    NameRow(name: .constant("Name"))
}
