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

    func fetch(descriptor: FetchDescriptor<Element>) throws -> [Element] {
        do {
            print("fetch, descriptor: \(descriptor)")
            return try modelContext.fetch(descriptor)
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

    func edit(_ element: Element) throws {
        do {
            try add(element)
        } catch {
            throw SwiftDataError.edit
        }
    }
}
