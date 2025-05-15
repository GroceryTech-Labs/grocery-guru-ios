import Foundation

public enum HTTPRequestError: Error {
    case httpClientError(response: HTTPURLResponse, data: Data)
    case httpServerError(response: HTTPURLResponse, data: Data)
    case unexpectedHTTPResponse(response: HTTPURLResponse, data: Data)
    case unknownResponse(response: URLResponse, data: Data)
}
