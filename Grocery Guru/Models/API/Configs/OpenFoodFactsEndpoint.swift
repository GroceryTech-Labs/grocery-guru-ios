import UIKit

final class OpenFoodFactsEndpoint: EndpointConfig {
    var baseURL: String {
        #if DEBUG
            return stagingURL
        #elseif RELEASE
            return productionURL
        #endif
    }

    var stagingURL: String = "https://world.openfoodfacts.org/api/v2"
    var productionURL: String = "https://world.openfoodfacts.org/api/v2"

    init() { }

    func getUserAgent() -> String {
        let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""

        return appName + "/" + appVersion + " (contact@grocerytech-labs.com)"
    }
}
