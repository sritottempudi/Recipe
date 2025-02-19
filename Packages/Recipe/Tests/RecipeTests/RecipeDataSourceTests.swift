//
//  File.swift
//  Recipe
//
//  Created by Srinivasa Rao Tottempudi on 2/14/25.
//

import XCTest
import Common
import DataModels
import NetworkService
@testable import Recipe

final class MockDataSourceTests: XCTestCase {
    
    var mockService: MockNetworkService!
    var dataSource: RecipeRemoteDataSourceProtocol!
    
    override func setUp() {
        super.setUp()
        print("SRI: setup called")
        mockService = MockNetworkService()
        DependencyInjectedFactory.shared.register(mockService,
                                                  for: NetworkServiceable.self)
        dataSource = RecipeRemoteDataSource()
        DependencyInjectedFactory.shared.register(dataSource,
                                                  for: RecipeRemoteDataSourceProtocol.self)
        
    }
    
    override func tearDown() {
        super.tearDown()
        print("SRI: teardown called")
        mockService = nil
        dataSource = nil
        DependencyInjectedFactory.shared.clearAll()
    }
    
    func testFetchRecipe_Success() async throws {
        let expectedRecipe = RecipeResponse(recipes: [.init(cuisine: "",
                                                            name: "Pizza",
                                                            photoURLLarge: "",
                                                            photoURLSmall: "",
                                                            sourceURL: nil,
                                                            uuid: "",
                                                            youtubeURL: nil)])
        mockService.mockResult = .success(expectedRecipe)
        let result = try await dataSource.fetchRecipe(path: "recipe_endpoint")
        XCTAssertEqual(result.recipes.count, 1)
        XCTAssertEqual(result.recipes.first?.name, "Pizza")
    }
    
    func testFetchRecipe_Failure() async throws {
        mockService.mockResult = .failure(NetworkError.unknown)
        
        do {
            _ = try await dataSource.fetchRecipe(path: "recipe_endpoint")
            XCTFail("Expected request failure but succeeded")
        } catch {
            XCTAssertEqual(error as? NetworkError, .unknown)
        }
        
    }
}


