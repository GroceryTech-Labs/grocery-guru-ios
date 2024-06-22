import Foundation

class APIService: APIServiceProtocol {
    static var shared = APIService()

    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func request<Item: Decodable>(
        _ type: Item.Type,
        url: URL,
        method: HTTPMethod
    ) async throws -> Item {
        print("🔵 Request: \(url.absoluteString)")
        return try await withCheckedThrowingContinuation { continuation in
            fetchItem(type, url: url, method: method) { result in
                switch result {
                case .success(let result):
                    // Resume with result
                    continuation.resume(returning: result)

                case .failure(let error):
                    // Resume with error
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    private func fetchItem<Item: Decodable>(
        _ type: Item.Type,
        url: URL,
        method: HTTPMethod,
        completion: @escaping (Result<Item, Error>) -> Void
    ) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue(OFFAPIConfig().getUserAgent(), forHTTPHeaderField: "User-Agent")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                completion(.failure(error))
                return
            }

            // swiftlint:disable no_magic_numbers

            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                switch statusCode {
                case 200:
                    break

                default:
                    completion(.failure(self.resolveStatusCodeError(for: statusCode)))
                    return
                }
            }

            // swiftlint:enable no_magic_numbers

            guard let data else {
                completion(.failure(APIError.missingData))
                return
            }

            do {
                // Parse the JSON data
                let result = try JSONDecoder().decode(Item.self, from: data)
                completion(.success(result))
                return
            } catch {
                completion(.failure(error))
                return
            }
        }
        task.resume()
    }

    // swiftlint:disable no_magic_numbers

    private func resolveStatusCodeError(for statusCode: Int) -> APIError {
        switch statusCode {
        case 404:
            return APIError.notFound

        case 500:
            return APIError.internalServer

        case 503:
            return APIError.serviceUnavailable

        default:
            return APIError.unknownStatus
        }
    }

    // swiftlint:enable no_magic_numbers
}
