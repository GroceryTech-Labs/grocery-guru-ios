import Foundation
import SwiftData

public protocol SwiftDataRepository<Element>: ModelActor, Sendable {
    associatedtype Element: PersistentModel

    /// Get all elements with associated type from the repository.
    func fetch(descriptor: FetchDescriptor<Element>) throws -> [Element]

    /// Add an element with associated type to the repository.
    func add(_ element: Element) throws

    /// Remove element from the repository.
    func delete(_ element: Element)

    /// Edit element within the repository.
    func edit(_ element: Element) throws
}

extension SwiftDataRepository {
    public func fetch(descriptor: FetchDescriptor<Element> = FetchDescriptor<Element>()) throws -> [Element] {
        try fetch(descriptor: descriptor)
    }
}
