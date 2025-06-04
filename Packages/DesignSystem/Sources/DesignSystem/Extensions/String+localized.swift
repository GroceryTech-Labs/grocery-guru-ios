extension String {
    var localized: String {
        String(localized: String.LocalizationValue(self), bundle: .main)
    }
}
