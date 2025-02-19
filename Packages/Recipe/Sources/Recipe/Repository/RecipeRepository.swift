//
//  RecipeRepository.swift
//  Recipe
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import DataModels
import Combine
import Common
import Foundation

class RecipeRepository: RecipeRepositoryeProtocol, @unchecked Sendable {

    @Inject private var remotrDataSource: RecipeRemoteDataSourceProtocol
    
    func getRecipe() async throws -> RecipeResponse {
        try await remotrDataSource.fetchRecipe(path: "recipes.json")
    }
}
