import Foundation

protocol EndpointConfig {
    var stagingURL: String { get }
    var productionURL: String { get }
}
