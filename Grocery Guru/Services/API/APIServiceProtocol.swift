import Foundation

// swiftlint:disable identifier_name

protocol APIServiceProtocol: AnyObject {
    func request<Item: Decodable>(_ type: Item.Type, url: URL, method: HTTPMethod) async throws -> Item
}

// swiftlint:enable identifier_name
