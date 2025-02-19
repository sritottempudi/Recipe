//
//  RecipeDependencyContainer.swift
//  Recipe
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Common

public class RecipeDependencyContainer {
    
    public static func register() {
        DependencyInjectedFactory.shared.register(RecipeRemoteDataSource(),
                                                  for: RecipeRemoteDataSourceProtocol.self)
        DependencyInjectedFactory.shared.register(RecipeRepository(),
                                                  for: RecipeRepositoryeProtocol.self)
        DependencyInjectedFactory.shared.register(FetchRemoteRecipeUseCase(),
                                                  for: FetchRemoteRecipeUseCase.self)
    }
}
