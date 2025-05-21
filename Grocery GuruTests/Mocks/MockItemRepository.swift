import Foundation
import SwiftData
import Categories

final class MockLocalStorageRepository: LocalStorageRepository {
    @MainActor static var mockInstance = MockLocalStorageRepository()

    // swiftlint:disable force_try
    @MainActor
    override init() {
        let modelConfiguration = ModelConfiguration(
            "MockPreview",
            schema: Schema([InvoiceItem.self, CustomCategory.self]),
            isStoredInMemoryOnly: true
        )
        super.init()
        self.modelContainer = try! ModelContainer(
            for: InvoiceItem.self, CustomCategory.self,
            configurations: modelConfiguration
        )
        self.modelContext = modelContainer.mainContext
    }
    // swiftlint:enable force_try
}
