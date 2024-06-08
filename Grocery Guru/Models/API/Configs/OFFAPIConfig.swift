import UIKit

final class OFFAPIConfig: APIConfigProtocol {
    enum Request {
        case product(barcode: String)
    }

    static var shared = OFFAPIConfig()

    // swiftlint:disable force_unwrapping

    var baseURL: URL {
        #if DEBUG
            return URL(string: stagingURL)!
        #elseif RELEASE
            return URL(string: productionURL)!
        #endif
    }

    // swiftlint:enable force_unwrapping

    var stagingURL: String = "https://world.openfoodfacts.net/api/v2"
    var productionURL: String = "https://world.openfoodfacts.org/api/v2"

    private init() { }

    func getUserAgent() -> String {
        let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""

        return appName + "/" + appVersion + " (contact@grocerytech-labs.com)"
    }
}
