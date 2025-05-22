import Foundation
import SwiftData

public protocol SwiftDataRepository<Element>: ModelActor, Sendable {
    associatedtype Element

    /// Get all elements with associated type from the repository.
    func fetch() throws -> [Element]

    /// Add an element with associated type to the repository.
    func add(_ element: Element) throws

    /// Remove element from the repository.
    func delete(_ element: Element)
}
