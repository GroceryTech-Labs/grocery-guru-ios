import Foundation
import SwiftData
import LocalStorage

@ModelActor
public actor CategoryRepository: SwiftDataRepository {
    // swiftlint:disable force_try
    public init() {
        self.init(modelContainer: try! ModelContainer(for: CustomCategory.self))
    }
    // swiftlint:enable force_try

    public func fetch() async throws -> [CustomCategory] {
        do {
            return try modelContext.fetch(FetchDescriptor<CustomCategory>())
        } catch {
            throw SwiftDataError.fetch
        }
    }

    public func add(_ element: CustomCategory) throws {
        modelContext.insert(element)
        do {
            try modelContext.save()
        } catch {
            throw SwiftDataError.adding
        }
    }

    public func delete(_ element: CustomCategory) {
        modelContext.delete(element)
    }
}
