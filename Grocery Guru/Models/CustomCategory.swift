import Foundation
import SwiftData

@Model
final class CustomCategory {
    let name: String
    let symbol: String

    init(name: String, symbol: String) {
        self.name = name
        self.symbol = symbol
    }
}
