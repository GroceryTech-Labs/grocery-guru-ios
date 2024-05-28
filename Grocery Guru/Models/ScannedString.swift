import Foundation

struct ScannedString: Identifiable, Codable, Hashable {
    var id: UUID
    var value: String
    
    init(value: String) {
        self.id = UUID()
        self.value = value
    }
}

extension Array<ScannedString>: Identifiable {
    public var id: UUID { UUID() }
}
