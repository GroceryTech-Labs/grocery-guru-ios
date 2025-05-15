import SwiftUI

struct NameRow: View {
    @Binding var name: String

    var body: some View {
        SectionHeader("Name", font: .headline) {
            TextField(
                "Name",
                text: $name,
                prompt: Text("Pringles")
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
