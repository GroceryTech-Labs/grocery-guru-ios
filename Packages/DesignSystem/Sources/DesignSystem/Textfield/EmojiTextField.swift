import SwiftUI

public class EmojiTextField: UITextField {
    override public var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if let primaryLanguage = mode.primaryLanguage, primaryLanguage == "emoji" {
                return mode
            }
        }
        return super.textInputMode
    }

    func addDoneButton() {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.items = [flexSpace, doneButton]
        inputAccessoryView = toolbar
    }

    @objc private func doneButtonTapped() {
        self.resignFirstResponder()
    }
}

private extension String {
    var containsOnlyEmojis: Bool {
        return !self.isEmpty && self.unicodeScalars.contains { $0.properties.isEmoji }
    }
}

public struct EmojiTextFieldWrapper: UIViewRepresentable {
    @Binding var text: String

    public init(text: Binding<String>) {
        self._text = text
    }

    public func makeUIView(context: Context) -> EmojiTextField {
        let textField = EmojiTextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "e.g 🛒"
        textField.delegate = context.coordinator
        textField.addDoneButton()
        return textField
    }

    public func updateUIView(_ uiView: EmojiTextField, context: Context) {
        uiView.text = text
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator($text)
    }

    public class Coordinator: NSObject, UITextFieldDelegate {
        var text: Binding<String>

        init(_ text: Binding<String>) {
            self.text = text
        }

        public func textField(
            _ textField: UITextField,
            shouldChangeCharactersIn range: NSRange,
            replacementString string: String
        ) -> Bool {
            if string.isEmpty {
                return true
            }

            guard string.containsOnlyEmojis else {
                return false
            }

            textField.text = string
            text.wrappedValue = string
            return false
        }

        public func textFieldDidChangeSelection(_ textField: UITextField) {
            text.wrappedValue = textField.text ?? ""
        }
    }
}
