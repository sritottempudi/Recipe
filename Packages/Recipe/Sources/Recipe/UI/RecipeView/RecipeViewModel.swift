//
//  RecipeViewModel.swift
//  Recipe
//
//  Created by Srinivasa Rao Tottempudi on 2/11/25.
//

import Foundation
import Common
import DataModels

@MainActor
public class RecipeViewModel: ObservableObject {
    
    @Inject private var recipeUseCase: FetchRemoteRecipeUseCase
    @Published var viewState: RecipeViewState
    
    public init() {
        self.viewState = .loading
    }
    
    func fetchRecipe() async {
        do {
            let data: RecipeResponse = try await recipeUseCase.execute()
            self.viewState = .loaded(data)
        }
        catch {
            print("Error is \(error)")
        }
    }
}
