//
//  FetchRemoteRecipeUseCase.swift
//  Recipe
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Foundation
import Common
import DataModels

class FetchRemoteRecipeUseCase: @unchecked Sendable {
    
    @Inject private var repository: RecipeRepositoryeProtocol

    init() {
        
    }
    
    init(repository: RecipeRepositoryeProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> RecipeResponse {
        try await repository.getRecipe()
    }
}
