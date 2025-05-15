import Foundation

actor GGAPIImpl: GGAPI {
    private let baseURL: URL

    init(_ baseURL: String) {
        guard let url = URL(string: baseURL) else { fatalError("Invalid base URL: \(baseURL)") }
        self.baseURL = url
    }

    func request<T>(_ request: any APIRequest<T>) async throws -> T where T: Decodable, T: Sendable {
        let urlRequest = request.urlRequest(relativeTo: baseURL)

        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            return try parse(response, data: data, decoder: request.decoder)
        } catch {
            print("\(error.localizedDescription)")
            throw error
        }
    }

    // swiftlint:disable force_cast

    private func parse<T>(_ response: URLResponse, data: Data, decoder: JSONDecoder?) throws -> T where T: Decodable {
        try check(response, data: data)

        if T.self == String.self {
            return String(data: data, encoding: .utf8) as! T
        } else if T.self == Data.self {
            return data as! T
        } else {
            let decoder = decoder ?? JSONDecoder()
            let payload = try decoder.decode(T.self, from: data)
            return payload
        }
    }

    // swiftlint:enable force_cast

    private func check(_ response: URLResponse, data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw HTTPRequestError.unknownResponse(response: response, data: data)
        }

        switch httpResponse.statusCode {
        case 200...299:
            // Success Responses
            break

        case 400...499:
            // Client Errors
            throw HTTPRequestError.httpClientError(response: httpResponse, data: data)

        case 500...599:
            // Server Errors
            throw HTTPRequestError.httpServerError(response: httpResponse, data: data)

        default:
            // (https://datatracker.ietf.org/doc/html/rfc9110)
            // Anything outside of 200...299, 400...599 is either unexpected, or not defined in [RFC 9110]
            throw HTTPRequestError.unexpectedHTTPResponse(response: httpResponse, data: data)
        }
    }
}
