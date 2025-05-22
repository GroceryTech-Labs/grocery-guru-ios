import Foundation
import SwiftData

@ModelActor
public actor SwiftDataRepositoryImpl<Element: PersistentModel>: SwiftDataRepository {
    public typealias Element = Element

    // swiftlint:disable force_try
    public init() {
        self.init(modelContainer: try! ModelContainer(for: Element.self))
    }
    // swiftlint:enable force_try

    public func fetch() async throws -> [Element] {
        do {
            return try modelContext.fetch(FetchDescriptor<Element>())
        } catch {
            throw SwiftDataError.fetch
        }
    }

    public func add(_ element: Element) throws {
        modelContext.insert(element)
        do {
            try modelContext.save()
        } catch {
            throw SwiftDataError.adding
        }
    }

    public func delete(_ element: Element) {
        modelContext.delete(element)
    }
}
