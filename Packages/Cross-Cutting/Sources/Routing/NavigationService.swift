import SwiftUI

@Observable
public final class NavigationService: NavigationServiceProtocol {
    nonisolated(unsafe) public static var shared = NavigationService()

    public var path = [NavigationDestination]()
    public var sheet: NavigationDestination?

    public init() { }

    public func push(_ destination: NavigationDestination) {
        path.append(destination)
    }

    public func sheet(_ destination: NavigationDestination) {
        sheet = destination
    }

    public func drop() {
        guard sheet == nil else {
            sheet = nil
            return
        }

        guard !path.isEmpty else {
            return
        }

        path.removeLast()
    }

    public func dropUntil(_ destination: NavigationDestination) {
        sheet = nil

        guard path.contains(destination) else {
            return
        }

        while path.last != destination {
            path.removeLast()
        }
    }

    public func dropToRoot() {
        sheet = nil
        path.removeAll()
    }
}
