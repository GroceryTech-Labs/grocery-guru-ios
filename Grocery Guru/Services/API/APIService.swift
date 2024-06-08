import Foundation

// swiftlint:disable identifier_name direct_return

final class APIService: APIServiceProtocol {
    static var shared = APIService()

    func request<Item: Decodable>(_ type: Item.Type, url: URL, method: HTTPMethod) async throws -> Item {
        let items = try await withCheckedThrowingContinuation { continuation in
            fetchItem(type, url: url, method: method) { result in
                switch result {
                case .success(let albums):
                    // Resume with fetched albums
                    continuation.resume(returning: albums)

                case .failure(let error):
                    // Resume with error
                    continuation.resume(throwing: error)
                }
            }
        }

        return items
    }

    func fetchItem<Item: Decodable>(
        _ type: Item.Type,
        url: URL,
        method: HTTPMethod,
        completion: @escaping (Result<Item, Error>) -> Void
    ) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error {
                completion(.failure(error))
                return
            }

            guard let data else {
                completion(.failure(APIError.missingData))
                return
            }

            do {
                // Parse the JSON data
                let result = try JSONDecoder().decode(Item.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

// swiftlint:enable identifier_name direct_return
