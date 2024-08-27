import SwiftUI
import SwiftData

@main
struct Grocery_GuruApp: App {
    @State private var navigationService = NavigationService.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationService.path) {
                HomeView(
                    viewModel: HomeViewModel(
                        repository: .shared
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
