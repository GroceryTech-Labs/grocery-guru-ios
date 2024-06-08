import Foundation

protocol APIServiceProtocol: AnyObject {
    func request<Item: Decodable>(_ type: Item.Type, url: URL, method: HTTPMethod) async throws -> Item
}
