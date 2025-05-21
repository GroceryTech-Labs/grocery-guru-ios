import SwiftUI
import SwiftData
import LocalStorage

@main
struct Grocery_GuruApp: App {
    @State private var navigationService = NavigationService.shared

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationService.path) {
                HomeView()
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
