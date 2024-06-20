import SwiftData

@Model
final class UserSettings {
    let categories: [CustomCategory]

    init(categories: [CustomCategory]) {
        self.categories = categories
    }
}
