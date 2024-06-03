import SwiftUI
import SwiftData

@main
struct Grocery_GuruApp: App {
    private let container: ModelContainer
    @State private var navigationService = NavigationService.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationService.path) {
                HomeView(
                    viewModel: HomeViewModel(
                        repository: LocalStorageItemRepository(
                            modelContext: container.mainContext
                        )
                    )
                )
                .navigationDestination(for: NavigationDestination.self) { destination in
                    destination.view
                }
                .sheet(item: $navigationService.sheet) { destination in
                    destination.view
                }
            }
        }
        .modelContainer(container)
    }

    init() {
        let schema = Schema([InvoiceItem.self])

        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )

        do {
            container = try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
}
