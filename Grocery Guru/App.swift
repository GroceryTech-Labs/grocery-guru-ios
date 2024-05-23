import SwiftUI
import SwiftData

@main
struct Grocery_GuruApp: App {
    let container: ModelContainer

    var body: some Scene {
        WindowGroup {
            HomeView(
                viewModel: HomeViewModel(
                    repository: LocalStorageItemRepository(
                        modelContext: container.mainContext
                    )
                )
            )
        }
        .modelContainer(container)
    }
    
    init() {
        let schema = Schema([
            Item.self,
            CustomItemCategoryConfig.self,
        ])
        
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
