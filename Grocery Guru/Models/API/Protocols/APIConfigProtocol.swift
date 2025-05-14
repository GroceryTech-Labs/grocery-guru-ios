import Foundation

protocol APIConfigProtocol {
    var stagingURL: String { get }
    var productionURL: String { get }
}
