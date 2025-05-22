import Foundation
import SwiftData

public protocol SwiftDataRepository: ModelActor, Sendable {
    associatedtype Element

    /// Get all elements with associated type from the repository.
    func fetch() async throws -> [Element]

    /// Add an element with associated type to the repository.
    func add(_ item: Element) throws

    /// Remove element from the repository.
    func delete(_ item: Element)
}
