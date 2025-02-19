//
//  RecipeResponse.swift
//  DataModels
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Foundation

// MARK: - RecipeResponse
public struct RecipeResponse: Decodable, Sendable {
    public let recipes: [Recipe]
    
    public init(recipes: [Recipe]) {
        self.recipes = recipes
    }
}
