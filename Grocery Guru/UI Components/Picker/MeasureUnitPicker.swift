import SwiftUI

struct MeasureUnitPicker: View {
    @Binding var unit: MeasureUnit

    var body: some View {
        Picker("Measure Unit", selection: $unit) {
            ForEach(MeasureUnit.allCases, id: \.hashValue) { unit in
                Text(unit.localized)
                    .tag(unit)
            }
        }
        .pickerStyle(.segmented)
    }

    init(_ unit: Binding<MeasureUnit>) {
        self._unit = unit
    }
}

#Preview {
    MeasureUnitPicker(.constant(.gram))
}
