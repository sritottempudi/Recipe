//
//  RecipeRepositoryeProtocol.swift
//  Recipe
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Foundation
import DataModels

protocol RecipeRepositoryeProtocol {
    func getRecipe() async throws -> RecipeResponse
}
