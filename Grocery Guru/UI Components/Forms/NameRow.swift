import SwiftUI
import DesignSystem

struct NameRow: View {
    @Binding var name: String

    var body: some View {        
    }
}

#Preview {
    NameRow(name: .constant("Name"))
}
