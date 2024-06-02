import SwiftUI

@Observable
class NavigationService: NavigationServiceProtocol {
    static var shared = NavigationService()

    var path = [NavigationDestination]()

    func push(_ destination: NavigationDestination) {
        path.append(destination)
    }

    func drop() {
        guard !path.isEmpty else {
            return
        }

        path.removeLast()
    }

    func dropUntil(_ destination: NavigationDestination) {
        guard path.contains(destination) else {
            return
        }

        while path.last != destination {
            path.removeLast()
        }
    }

    func dropToRoot() {
        path.removeAll()
    }
}
