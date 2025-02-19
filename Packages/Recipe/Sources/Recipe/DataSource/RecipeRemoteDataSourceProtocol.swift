//
//  RecipeRemoteDataSourceProtocol.swift
//  Recipe
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Foundation
import DataModels

protocol RecipeRemoteDataSourceProtocol {
    func fetchRecipe(path: String) async throws -> RecipeResponse
}
