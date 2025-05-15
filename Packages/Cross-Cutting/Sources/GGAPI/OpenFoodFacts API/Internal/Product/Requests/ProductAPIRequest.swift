import Foundation

class ProductAPIRequest: APIRequest, @unchecked Sendable {

    typealias Item = GETProductResponse

    let decoder: JSONDecoder? = nil
    let path: String
    let queryItems: [URLQueryItem]

    var httpMethod: HTTPMethod {
        .get
    }

    var httpUserAgent: String? {
        let appName = Bundle.main.infoDictionary?["CFBundleName"] as? String ?? ""
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""

        return appName + "/" + appVersion + " (contact@grocerytech-labs.com)"
    }

    init(_ path: String, queryItems: [URLQueryItem] = []) {
        self.path = path
        self.queryItems = queryItems
    }
}
