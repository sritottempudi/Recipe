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

final class MockRemoteDataSourceTests: XCTestCase {
    
    var mockService: NetworkService!
    var dataSource: RecipeRemoteDataSourceProtocol!
    
    override func setUp() {
        super.setUp()
        print("SRI: setup called")
        mockService = NetworkService()
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
        let result = try await dataSource.fetchRecipe(path: "recipes.json")
        XCTAssertNotNil(result.recipes.count)
    }
    
    func testFetchRecipe_Empty() async throws {
        let result = try await dataSource.fetchRecipe(path: "recipes-empty.json")
        XCTAssertEqual(result.recipes.count, 0)
        
    }
    
    func testFetchRecipe_DecodingFailure() async throws {
        do {
            _ = try await dataSource.fetchRecipe(path: "recipes-malformed.json")
        }
        catch {
            XCTAssertEqual(error as? NetworkError, .decodingError)
        }
    }
    
    func testFetchRecipe_RequestFailure() async throws {
        do {
            let data = try await dataSource.fetchRecipe(path: "failuedRequest")
            print(data)
        }
        catch {
            XCTAssertEqual(error as? NetworkError, .requestFailed)
        }
    }
}


