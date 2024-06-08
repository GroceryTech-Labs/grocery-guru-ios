import Foundation

// swiftlint:disable identifier_name

protocol APIServiceProtocol: AnyObject {
    func request<Item: Decodable>(_ type: Item.Type, url: URL, method: HTTPMethod) async throws -> Item

    func fetchItem<Item: Decodable>(
        _ type: Item.Type,
        url: URL,
        method: HTTPMethod,
        completion: @escaping (Result<Item, Error>) -> Void
    )
}

// swiftlint:enable identifier_name
