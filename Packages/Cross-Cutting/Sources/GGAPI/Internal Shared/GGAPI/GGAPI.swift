import Foundation

protocol GGAPI: Actor {
    func request<T>(_ request: any APIRequest<T>) async throws -> T where T: Decodable & Sendable
}
