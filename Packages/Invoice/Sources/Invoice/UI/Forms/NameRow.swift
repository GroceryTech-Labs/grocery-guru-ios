import SwiftUI
import DesignSystem

struct NameRow: View {
    @Binding var name: String

    var body: some View {
        SectionHeader("Name".localized, font: .headline) {
            TextField(
                "Name".localized,
                text: $name,
                prompt: Text("Pringles".localized)
            )
            .textFieldStyle(.roundedBorder)
            .accessibilityIdentifier(
                AccessibilityIdentifier.TextField.invoiceFormName
            )
        }
    }
}

#Preview {
    NameRow(name: .constant("Name"))
}
