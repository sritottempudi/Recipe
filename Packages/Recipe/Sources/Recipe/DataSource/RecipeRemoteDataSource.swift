//
//  RecipeRemoteDataSource.swift
//  Recipe
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Foundation
import Common
import DataModels
import NetworkService

class RecipeRemoteDataSource: RecipeRemoteDataSourceProtocol  {
    
    @Inject private var service: NetworkServiceable
    
    func fetchRecipe(path: String) async throws -> RecipeResponse {
        do {
            return try await service.request(networkRequest: NetworkRequest(path: path,
                                                                        method: "get",
                                                                        headers: nil,
                                                                        body: nil))
        }
        catch let error {
            throw error
        }
    }
}
