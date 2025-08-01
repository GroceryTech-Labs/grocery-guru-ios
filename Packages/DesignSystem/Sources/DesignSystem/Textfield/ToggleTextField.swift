import SwiftUI

public struct ToggleTextField: View {
    @Environment(\.editMode) private var editMode

    private let label: String
    @Binding private var text: String
    private let prompt: String

    public init(label: String, text: Binding<String>, prompt: String) {
        self.label = label
        self._text = text
        self.prompt = prompt
    }

    public var body: some View {
        TextField(
            label,
            text: $text,
            prompt: Text(prompt)
        )
        .textFieldStyle(
            ToggleTextFieldStyle(
                text: $text,
                editMode: editMode?.wrappedValue
            )
        )
        .disabled(!(editMode?.wrappedValue.isEditing ?? false))
    }
}
