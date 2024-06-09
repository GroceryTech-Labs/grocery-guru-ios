import SwiftUI
import SwiftData

@main
struct Grocery_GuruApp: App {
    @State private var navigationService = NavigationService.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationService.path) {
                let testMode = ProcessInfo.processInfo.arguments.contains("testMode")

                HomeView(
                    viewModel: HomeViewModel(
                        repository: testMode ?
                        MockLocalStorageItemRepository() : LocalStorageItemRepository.shared
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
    }
}
