import Foundation
import SwiftData

@available(iOS 17, *) @Model
public final class CustomCategory: @unchecked Sendable {
    public var name: String
    public var emoji: String

    public init(name: String, emoji: String) {
        self.name = name
        self.emoji = emoji
    }
}
