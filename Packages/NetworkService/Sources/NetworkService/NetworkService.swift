// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public final class NetworkService: NetworkServiceable {
    
    public init() {
        
    }
    
    public func request<T: Decodable>(networkRequest: NetworkRequest) async throws -> T {
        guard let url = networkRequest.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = networkRequest.method
        request.httpBody = networkRequest.body
        request.allHTTPHeaderFields = networkRequest.headers
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw NetworkError.requestFailed
            }
            
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingError
            }
        } catch (let error as NetworkError) {
            throw error
        }
        catch {
            throw NetworkError.unknown
        }
    }
}


/*
 @Test
     func testFetchUser_InvalidJSON() async throws {
         // Given: An invalid JSON response
         let invalidJsonData = "invalid data".data(using: .utf8)!
         mockService.mockResult = .success(invalidJsonData)

         // When/Then: Expect a decoding error
         await XCTAssertThrowsError(try await mockService.request(endpoint: NetworkRequest(path: "/users/1", method: "GET", headers: nil, body: nil))) { error in
             XCTAssertTrue(error is APIError)
         }
     }

     @Test
     func testFetchUser_Failure() async throws {
         // Given: A failed API response
         mockService.mockResult = .failure(APIError.requestFailed(statusCode: 500))

         // When/Then: Expect a request failure
         await XCTAssertThrowsError(try await mockService.request(endpoint: NetworkRequest(path: "/users/1", method: "GET", headers: nil, body: nil))) { error in
             if case APIError.requestFailed(let statusCode) = error {
                 XCTAssertEqual(statusCode, 500)
             } else {
                 XCTFail("Expected APIError.requestFailed but got \(error)")
             }
         }
     }
 */
