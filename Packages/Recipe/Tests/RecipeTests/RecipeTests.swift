import XCTest
import NetworkService
import DataModels
@testable import Recipe

public class MockNetworkService: NetworkServiceable {
    public var mockResult: Result<RecipeResponse, Error>?
    
    public func request<T: Decodable>(networkRequest: NetworkRequest) async throws -> T {
        guard let result = mockResult else {
            throw NetworkError.unknown
        }
        
        switch result {
        case .success(let data):
            return data as! T
            
        case .failure(let error):
            throw error
        }
    }
}

