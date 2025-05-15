import UIKit

final public class OpenFoodFactsEndpoint {
    public static var baseURL: String {
        #if DEBUG
            return stagingURL
        #elseif RELEASE
            return productionURL
        #endif
    }

    private static let stagingURL: String = "https://world.openfoodfacts.org/api/v2"
    private static let productionURL: String = "https://world.openfoodfacts.org/api/v2"
}
