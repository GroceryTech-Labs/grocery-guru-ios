import UIKit

final class OFFAPIConfig: APIConfigProtocol {
    enum Request {
        case product(barcode: String)
    }

    static var shared = OFFAPIConfig()

    var stagingURL: String = "https://world.openfoodfacts.net"
    var productionURL: String = "https://world.openfoodfacts.org"

    func getUserAgent() -> String {
        let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""

        return appName + "/" + appVersion + " (contact@grocerytech-labs.com)"
    }
}
