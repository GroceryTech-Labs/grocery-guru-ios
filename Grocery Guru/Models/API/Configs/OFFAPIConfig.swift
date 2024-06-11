import UIKit

final class OFFAPIConfig: APIConfigProtocol {
    enum Request {
        case product(barcode: String)
    }

    static var shared = OFFAPIConfig()

    var baseURL: String {
        #if DEBUG
            return stagingURL
        #elseif RELEASE
            return productionURL
        #endif
    }

    var stagingURL: String = "https://world.openfoodfacts.org/api/v2"
    var productionURL: String = "https://world.openfoodfacts.org/api/v2"

    private init() { }

    func getUserAgent() -> String {
        let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""

        return appName + "/" + appVersion + " (contact@grocerytech-labs.com)"
    }
}
