import Foundation
import SwiftData

class MockLocalStorageItemRepository: LocalStorageItemRepository {
    // swiftlint:disable force_try
    @MainActor
    override init() {
        let modelConfiguration = ModelConfiguration(
            "MockPreview",
            schema: Schema([InvoiceItem.self]),
            isStoredInMemoryOnly: true
        )
        super.init()
        self.modelContainer = try! ModelContainer(for: InvoiceItem.self, configurations: modelConfiguration)
        self.modelContext = modelContainer.mainContext
    }
    // swiftlint:enable force_try
}
