//
//  RecipeViewState.swift
//  Recipe
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import DataModels
import Foundation

enum RecipeViewState {
    case loading
    case loaded(RecipeResponse)
    case error
}
