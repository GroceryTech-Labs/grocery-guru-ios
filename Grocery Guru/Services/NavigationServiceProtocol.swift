import Foundation

protocol NavigationServiceProtocol: AnyObject {
    func push(_ destination: NavigationDestination)
    func sheet(_ destination: NavigationDestination)
    func drop()
    func dropUntil(_ destination: NavigationDestination)
    func dropToRoot()
}
