import Foundation

protocol APIRequest<Item> {
    associatedtype Item: Decodable

    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    var decoder: JSONDecoder? { get }

    var httpMethod: HTTPMethod { get }
    var httpUserAgent: String? { get }

    func urlRequest(relativeTo baseUrl: URL) -> URLRequest
}

extension APIRequest {
    func urlRequest(relativeTo baseUrl: URL) -> URLRequest {
        var urlComponents = URLComponents(url: baseUrl.appendingPathComponent(path), resolvingAgainstBaseURL: false)!
        if !queryItems.isEmpty {
            urlComponents.queryItems = queryItems
        }
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = httpMethod.rawValue
        if let httpUserAgent {
            urlRequest.setValue(httpUserAgent, forHTTPHeaderField: "User-Agent")
        }
        return urlRequest
    }
}
