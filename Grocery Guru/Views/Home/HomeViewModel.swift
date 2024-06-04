import SwiftUI

@Observable
final class HomeViewModel {
    @ObservationIgnored let repository: InvoiceItemRepository

    @MainActor
    init(repository: InvoiceItemRepository) {
        self.repository = repository
    }
}
