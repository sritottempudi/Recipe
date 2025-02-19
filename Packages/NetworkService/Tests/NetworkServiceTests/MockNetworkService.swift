//
//  MockNetworkService.swift
//  NetworkService
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Foundation
@testable import NetworkService

public class MockNetworkService: NetworkServiceable {
    public var mockResult: Result<Data, Error>?
    
    public func request<T: Decodable>(networkRequest: NetworkRequest) async throws -> T {
        guard let result = mockResult else {
            throw NetworkError.unknown
        }
        
        switch result {
        case .success(let data):
            do {
                return try JSONDecoder().decode(T.self, from: data)
            } catch {
                throw NetworkError.decodingError
            }
        case .failure(let error):
            throw error
        }
    }
}
