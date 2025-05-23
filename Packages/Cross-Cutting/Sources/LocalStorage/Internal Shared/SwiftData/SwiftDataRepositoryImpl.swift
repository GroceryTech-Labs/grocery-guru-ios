import Foundation
import SwiftData

@ModelActor
actor SwiftDataRepositoryImpl<Element: PersistentModel>: SwiftDataRepository {
    typealias Element = Element

    // swiftlint:disable force_try
    init() {
        self.init(modelContainer: try! ModelContainer(for: Element.self))
    }
    // swiftlint:enable force_try

    func fetch() throws -> [Element] {
        do {
            return try modelContext.fetch(FetchDescriptor<Element>())
        } catch {
            throw SwiftDataError.fetch
        }
    }

    func add(_ element: Element) throws {
        modelContext.insert(element)
        do {
            try modelContext.save()
        } catch {
            throw SwiftDataError.adding
        }
    }

    func delete(_ element: Element) {
        modelContext.delete(element)
    }
}
