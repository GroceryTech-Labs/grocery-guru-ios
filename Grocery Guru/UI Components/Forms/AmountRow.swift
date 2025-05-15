import SwiftUI

struct AmountRow: View {
    @Binding var amount: String
    @Binding var measureUnit: MeasureUnit

    var body: some View {
        SectionHeader("Amount", font: .headline) {
            HStack {
                TextField(
                    "Amount",
                    text: $amount
                )
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numbersAndPunctuation)
                .accessibilityIdentifier(AccessibilityIdentifier.TextField.invoiceFormAmount)

                MeasureUnitPicker($measureUnit)
            }
        }
    }
}

#Preview {
    AmountRow(
        amount: .constant("Amount"),
        measureUnit: .constant(.gram)
    )
}
