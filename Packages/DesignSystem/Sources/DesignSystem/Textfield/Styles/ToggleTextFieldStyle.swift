import SwiftUI

// swiftlint:disable all
public struct ToggleTextFieldStyle: TextFieldStyle, Sendable {
    @Binding public var text: String

    public var editMode: EditMode?

    private var isEditing: Bool {
        editMode?.isEditing ?? false
    }

    public init(text: Binding<String>, editMode: EditMode?) {
        self._text = text
        self.editMode = editMode
    }

    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(Constants.Padding.sizeS)
            .background(alignment: .bottom) {
                if isEditing {
                    Divider()
                } else {
                    EmptyView()
                }
            }
            .overlay(alignment: .trailing) {
                if isEditing {
                    Button {
                        text = ""
                    } label: {
                        Image(systemName: "xmark")
                    }
                    .buttonStyle(PlainButtonStyle())
                    .contentShape(Rectangle())
                    .padding(.trailing)
                } else {
                    EmptyView()
                }
            }
    }
}

// swiftlint:enable all
